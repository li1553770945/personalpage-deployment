# personal-file-service

个人站文件上传与存储服务。

## 部署

首次部署前请根据 `config-example.yml` 准备 `config-secret.yml`（勿提交密钥）。

从仓库根目录执行：

```bash
kubectl apply -f personal-page/personal-file-service/config-secret.yml
kubectl apply -f personal-page/personal-file-service/deployment.yml
kubectl apply -f personal-page/personal-file-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment personal-file-service-deployment
```
