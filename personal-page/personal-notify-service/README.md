# personal-notify-service

通知服务（如邮件等 outbound 通知）。

## 部署

首次部署前请根据 `config-example.yml` 准备 `config-secret.yml`（勿提交密钥）。

从仓库根目录执行：

```bash
kubectl apply -f personal-page/personal-notify-service/config-secret.yml
kubectl apply -f personal-page/personal-notify-service/deployment.yml
kubectl apply -f personal-page/personal-notify-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment personal-notify-service-deployment
```
