# Jaeger

all-in-one 链路追踪，存储为 Badger（默认保留 24h）。各服务经 OTel Collector 上报。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/observer/jaeger/deployment.yml
kubectl apply -f infra/observer/jaeger/service.yml
```

## 重启

```bash
kubectl rollout restart deployment jaeger
```

## 定时重启（可选）

缓解长时间运行后内存增长，可加入 crontab：

```bash
crontab -e
# 每天 17:53 重启
53 17 * * * ubuntu KUBECONFIG=/home/ubuntu/.kube/config /usr/local/bin/kubectl rollout restart deployment/jaeger -n default >> /var/log/jaeger-restart.log 2>&1
```
