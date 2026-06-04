# Uptime Kuma

服务可用性监控 Web 面板，数据持久化到 hostPath PV。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/observer/kuma/pv.yaml
kubectl apply -f infra/observer/kuma/pvc.yaml
kubectl apply -f infra/observer/kuma/kuma.yaml
kubectl apply -f infra/observer/kuma/service.yaml
```

## 重启

```bash
kubectl rollout restart deployment uptime-kuma
```
