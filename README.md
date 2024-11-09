# 个人主页后端部署

## 初始化环境

```bash
sudo hostnamectl set-hostname master-node # 设置计算机名

sudo systemctl stop kubelet
sudo kubeadm reset -f
sudo rm -rf /etc/cni/net.d
sudo rm -rf /etc/kubernetes /var/lib/etcd # 清除原有配置

sudo kubeadm init --control-plane-endpoint=master-node --upload-certs --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers --pod-network-cidr=10.244.0.0/16  -v=5
```

## busybox 用于测试

用于创建一个存在一个小时的 busybox，可以用于一些命令的测试，之后会自动关闭。

```bash
kubectl run busybox-test --image=swr.cn-north-4.myhuaweicloud.com/ddn-k8s/gcr.io/google-containers/busybox:latest --image-pull-policy=IfNotPresent --restart=Never -- sleep 3600
kubectl exec -it busybox-test -- sh

kubectl describe pods busybox-test
kubectl delete pod busybox-test
```
## etcd

```bash
kubectl apply -f etcd/deployment.yml
kubectl apply -f etcd/service.yml
```
## jaeger

```bash
kubectl apply -f jaeger/deployment.yml
kubectl apply -f jaeger/service.yml
```
## api-gateway

```bash
kubectl apply -f sheepim-api-gateway/configmap.yml
kubectl apply -f sheepim-api-gateway/deployment.yml
kubectl apply -f sheepim-api-gateway/service.yml

kubectl rollout restart deployment sheepim-api-gateway-deployment
```

## user-service

```bash
kubectl apply -f sheepim-user-service/config-secret.yml
kubectl apply -f sheepim-user-service/deployment.yml
kubectl apply -f sheepim-user-service/service.yml

kubectl rollout restart deployment sheepim-user-service-deployment
```

## auth-service

```bash

kubectl create secret generic jwt-key-secret --from-literal=JWT_KEY="$JWT_KEY" # 或者换成自定义的字符串
kubectl apply -f sheepim-auth-service/config-secret.yml
kubectl apply -f sheepim-auth-service/deployment.yml
kubectl apply -f sheepim-auth-service/service.yml

kubectl rollout restart deployment sheepim-auth-service-deployment
```

## project-service

```bash
kubectl apply -f personal-project-service/config-secret.yml
kubectl apply -f personal-project-service/deployment.yml
kubectl apply -f personal-project-service/service.yml

kubectl rollout restart deployment personal-project-service-deployment
```