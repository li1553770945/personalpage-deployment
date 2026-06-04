# Prometheus

指标采集；从 OTel Collector 的 Prometheus exporter 等目标拉取数据。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/observer/prometheus/configmap.yml
kubectl apply -f infra/observer/prometheus/deployment.yml
kubectl apply -f infra/observer/prometheus/service.yml
```

## 重启

```bash
kubectl rollout restart deployment prometheus-deployment
```
