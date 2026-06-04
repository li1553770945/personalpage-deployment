# OpenTelemetry Collector

接收各服务 OTLP，将 trace 转发至 Jaeger、metrics 暴露给 Prometheus 抓取。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/observer/otel/configmap.yml
kubectl apply -f infra/observer/otel/deployment.yml
kubectl apply -f infra/observer/otel/service.yml
```

## 重启

```bash
kubectl rollout restart deployment otelcol-deployment
```
