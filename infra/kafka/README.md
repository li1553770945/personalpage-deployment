# Kafka

KRaft 模式单节点，供 SheepIM push-proxy / push-worker 使用（topic: `messages`）。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/kafka/kafka-deployment.yml
kubectl apply -f infra/kafka/kafka-service.yml
```

## 重启

```bash
kubectl rollout restart statefulset kafka-deployment
```
