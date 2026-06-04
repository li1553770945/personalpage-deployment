# sheepim-room-service

SheepIM 聊天室管理（依赖 Redis）。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-room-service/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-room-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-room-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-room-service-deployment
```
