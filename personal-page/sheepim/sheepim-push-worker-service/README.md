# sheepim-push-worker-service

消费 Kafka 消息并推送到在线用户（经 connect / online / room 等 RPC）。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-push-worker-service/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-push-worker-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-push-worker-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-push-worker-service-deployment
```
