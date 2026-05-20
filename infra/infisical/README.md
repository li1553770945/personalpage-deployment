# Infisical

这里使用官方 Helm chart 部署 Infisical，本地只维护自定义配置：

- Redis 复用现有的 `redis-service.default.svc.cluster.local:6379`
- PostgreSQL 使用 chart 内置的单副本轻量实例
- PostgreSQL 数据持久化到宿主机 `/mnt/data/infisical/postgresql`

## 部署

先准备宿主机目录和 Secret：

```bash
sudo mkdir -p /mnt/data/infisical/postgresql

POSTGRES_PASSWORD="$(openssl rand -base64 32)"
AUTH_SECRET="$(openssl rand -base64 32)"
ENCRYPTION_KEY="$(openssl rand -hex 16)"

kubectl apply -f infra/infisical/namespace.yml
kubectl apply -f infra/infisical/postgresql-pv.yml

kubectl create secret generic infisical-secrets \
  -n infisical \
  --from-literal=AUTH_SECRET="$AUTH_SECRET" \
  --from-literal=ENCRYPTION_KEY="$ENCRYPTION_KEY" \
  --from-literal=SITE_URL="http://localhost:8080" \
  --from-literal=REDIS_URL="redis://redis-service.default.svc.cluster.local:6379" \
  --from-literal=DB_CONNECTION_URI="postgresql://infisical:${POSTGRES_PASSWORD}@postgresql.infisical.svc.cluster.local:5432/infisicalDB"
```

把同一个 PostgreSQL 密码写入临时 values 文件后安装：

```bash
sed "s/CHANGE_ME_POSTGRES_PASSWORD/${POSTGRES_PASSWORD}/g" \
  infra/infisical/values.yml > /tmp/infisical-values.yml

helm repo add infisical-helm-charts https://dl.cloudsmith.io/public/infisical/helm-charts/helm/charts/
helm repo update

helm upgrade --install infisical infisical-helm-charts/infisical-standalone \
  -n infisical \
  -f /tmp/infisical-values.yml
```

本机如果还没有 Helm，可以先安装：

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

## 访问

默认没有暴露到集群外，可用端口转发访问：

```bash
kubectl port-forward -n infisical svc/infisical 8080:8080
```

然后打开 `http://127.0.0.1:8080`。

## 运维命令

```bash
kubectl get pods,pvc,pv -n infisical
kubectl logs -n infisical deploy/infisical
kubectl rollout restart deployment/infisical -n infisical
```
