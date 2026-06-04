# personal-feedback-service

访客反馈提交与存储。

## 部署

首次部署前请根据 `config-example.yml` 准备 `config-secret.yml`（勿提交密钥）。

从仓库根目录执行：

```bash
kubectl apply -f personal-page/personal-feedback-service/config-secret.yml
kubectl apply -f personal-page/personal-feedback-service/deployment.yml
kubectl apply -f personal-page/personal-feedback-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment personal-feedback-service-deployment
```
