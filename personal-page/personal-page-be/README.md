# personal-page-be

个人网站单体后端，承接用户、项目、文件、反馈、通知、AI 对话、幻灯片、博客和临时聊天室 API。

`/api/rooms` 与 `/connect` 均由本服务处理；旧 SheepIM 微服务及其 etcd、Kafka、Redis 依赖已停用。聊天室状态保存在进程内，因此当前单节点部署保持 1 个副本。

```bash
kubectl apply -f personal-page/personal-page-be/config-secret.yml
kubectl apply -f personal-page/personal-page-be/deployment.yml
kubectl apply -f personal-page/personal-page-be/service.yml
kubectl rollout restart deployment personal-page-be-deployment
```

`config-example.yml` 是模板；实际部署时复制为 `config-secret.yml` 并填入数据库、COS、Dify、ServerChan、JWT 配置。
