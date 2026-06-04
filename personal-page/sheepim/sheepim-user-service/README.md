# sheepim-user-service

SheepIM 用户资料与账号相关 API。

## 部署

首次部署前请根据 `config-example.yml` 准备 `config-secret.yml`（勿提交密钥）。

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-user-service/config-secret.yml
kubectl apply -f personal-page/sheepim/sheepim-user-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-user-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-user-service-deployment
```
