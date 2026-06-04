# personal-aichat-service

个人站 AI 对话服务。

## 部署

首次部署前请根据 `config-example.yml` 准备 `config-secret.yml`（勿提交密钥）。

从仓库根目录执行：

```bash
kubectl apply -f personal-page/personal-aichat-service/config-secret.yml
kubectl apply -f personal-page/personal-aichat-service/deployment.yml
kubectl apply -f personal-page/personal-aichat-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment personal-aichat-service-deployment
```
