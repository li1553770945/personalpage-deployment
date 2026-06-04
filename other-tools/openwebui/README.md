# Open WebUI

本地大模型 Web 对话界面（K8s Deployment）。

## 部署

从仓库根目录执行：

```bash
kubectl apply -f other-tools/openwebui/config.yaml
kubectl apply -f other-tools/openwebui/deployment.yaml
kubectl apply -f other-tools/openwebui/service.yaml
```

## 重启

```bash
kubectl rollout restart deployment open-webui
```
