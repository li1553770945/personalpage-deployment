# etcd

三副本 StatefulSet，供 SheepIM 与各微服务做服务发现。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f infra/etcd/deployment.yml
kubectl apply -f infra/etcd/service.yml
```

## 重启

```bash
kubectl rollout restart statefulset etcd
```
