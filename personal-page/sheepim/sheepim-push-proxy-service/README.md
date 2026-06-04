# sheepim-push-proxy-service

将待推送消息写入 Kafka（topic: `messages`）。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-push-proxy-service/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-push-proxy-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-push-proxy-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-push-proxy-service-deployment
```
