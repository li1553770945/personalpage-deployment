# personal-page-be

个人网站单体后端，承接原 personal-project-service、personal-file-service、personal-feedback-service、personal-notify-service、personal-aichat-service 的 HTTP API。

聊天系统仍保留 sheepim 微服务，`/api/rooms` 继续走 sheepim-api-gateway，`/connect` 继续走 sheepim-connect-service。

```bash
kubectl apply -f personal-page/personal-page-be/config-secret.yml
kubectl apply -f personal-page/personal-page-be/deployment.yml
kubectl apply -f personal-page/personal-page-be/service.yml
kubectl rollout restart deployment personal-page-be-deployment
```

`config-example.yml` 是模板；实际部署时复制为 `config-secret.yml` 并填入数据库、COS、Dify、ServerChan、JWT 配置。
