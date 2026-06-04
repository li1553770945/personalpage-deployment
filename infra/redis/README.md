# Redis

集群内共享 Redis，供 SheepIM room/online 等及 Infisical 等组件使用。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/redis/configmap.yml
kubectl apply -f infra/redis/deployment.yml
kubectl apply -f infra/redis/service.yml
```

## 重启

```bash
kubectl rollout restart deployment redis
```
