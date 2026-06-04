# sheepim-auth-service

SheepIM 认证服务（登录、JWT 等）。

## 部署

创建 JWT Secret（可改为自定义密钥）：

```bash
kubectl create secret generic jwt-key-secret --from-literal=JWT_KEY="$JWT_KEY"
```

从仓库根目录执行：

```bash
kubectl apply -f personal-page/sheepim/sheepim-auth-service/configmap.yml
kubectl apply -f personal-page/sheepim/sheepim-auth-service/deployment.yml
kubectl apply -f personal-page/sheepim/sheepim-auth-service/service.yml
```

## 重启

```bash
kubectl rollout restart deployment sheepim-auth-service-deployment
```
