# sheepim-connect-service

SheepIM WebSocket 长连接网关。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-connect-service/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-connect-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-connect-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-connect-service-deployment
```
