# sheepim-api-gateway

SheepIM 对外 HTTP API 统一入口。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-api-gateway/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-api-gateway/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-api-gateway/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-api-gateway-deployment
```
