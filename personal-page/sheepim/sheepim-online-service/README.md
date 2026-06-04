# sheepim-online-service

SheepIM 用户在线状态（依赖 Redis）。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-online-service/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-online-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-online-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-online-service-deployment
```
