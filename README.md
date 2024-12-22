# 个人主页后端部署

## 初始化环境

### 正常流程
```bash
sudo hostnamectl set-hostname master-node # 设置计算机名


sudo kubeadm init --control-plane-endpoint=master-node --upload-certs --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers --pod-network-cidr=10.244.0.0/16  -v=5


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes master-node node-role.kubernetes.io/control-plane:NoSchedule-
kubectl apply -f k8s/kube-flannel.yml
kubectl apply -f k8s/metric.yml

```
### 遇到问题需要的命令

```bash
sudo systemctl stop kubelet
sudo kubeadm reset -f
sudo rm -rf /etc/cni/net.d /etc/kubernetes /var/lib/etcd ~/.kube # 清除原有配置


sudo kubeadm init --control-plane-endpoint=master-node --upload-certs --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers --pod-network-cidr=10.244.0.0/16  -v=5

sudo ctr -n k8s.io images tag \
  registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:v1.31.2 \
  registry.k8s.io/kube-apiserver:v1.31.2

sudo ctr -n k8s.io images tag \
  registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.10 \
  registry.k8s.io/pause:3.10
  
sudo journalctl -u kubelet -e

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

kubectl rollout restart statefulset etcd
```

## kafka

```bash
kubectl apply -f kafka/zookeeper-deployment.yml
kubectl apply -f kafka/zookeeper-service.yml

kubectl apply -f kafka/kafka-deployment.yml
kubectl apply -f kafka/kafka-service.yml

kubectl rollout restart statefulset kafka-deployment
```

## jaeger

```bash
kubectl apply -f jaeger/deployment.yml
kubectl apply -f jaeger/service.yml

crontab -e
53 17 * * * ubuntu KUBECONFIG=/home/ubuntu/.kube/config /usr/local/bin/kubectl rollout restart deployment/jaeger -n default >> /var/log/jaeger-restart.log 2>&1


kubectl rollout restart deployment jaeger

```

## otel

```bash

kubectl apply -f otel/configmap.yml
kubectl apply -f otel/deployment.yml
kubectl apply -f otel/service.yml

kubectl rollout restart deployment otel-deployment
```

## prometheus

```bash

kubectl apply -f prometheus/configmap.yml
kubectl apply -f prometheus/deployment.yml
kubectl apply -f prometheus/service.yml

kubectl rollout restart deployment prometheus-deployment
```


## redis

```bash
kubectl apply -f redis/configmap.yml
kubectl apply -f redis/deployment.yml
kubectl apply -f redis/service.yml
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

## feedback-service

```bash
kubectl apply -f personal-feedback-service/config-secret.yml
kubectl apply -f personal-feedback-service/deployment.yml
kubectl apply -f personal-feedback-service/service.yml

kubectl rollout restart deployment personal-feedback-service-deployment
```

## notify-service

```bash
kubectl apply -f personal-notify-service/config-secret.yml
kubectl apply -f personal-notify-service/deployment.yml
kubectl apply -f personal-notify-service/service.yml

kubectl rollout restart deployment personal-notify-service-deployment
```

## room-service

```bash
kubectl apply -f sheepim-room-service/configmap.yml
kubectl apply -f sheepim-room-service/deployment.yml
kubectl apply -f sheepim-room-service/service.yml

kubectl rollout restart deployment sheepim-room-service-deployment
```


## online-service

```bash
kubectl apply -f sheepim-online-service/configmap.yml
kubectl apply -f sheepim-online-service/deployment.yml
kubectl apply -f sheepim-online-service/service.yml

kubectl rollout restart deployment sheepim-online-service-deployment
```


## connect-service

```bash
kubectl apply -f sheepim-connect-service/configmap.yml
kubectl apply -f sheepim-connect-service/deployment.yml
kubectl apply -f sheepim-connect-service/service.yml

kubectl rollout restart deployment sheepim-online-service-deployment
```

## push-proxy-service

```bash
kubectl apply -f sheepim-push-proxy-service/configmap.yml
kubectl apply -f sheepim-push-proxy-service/deployment.yml
kubectl apply -f sheepim-push-proxy-service/service.yml

kubectl rollout restart deployment sheepim-push-proxy-service-deployment
```

## push-worker-service

```bash
kubectl apply -f sheepim-push-worker-service/configmap.yml
kubectl apply -f sheepim-push-worker-service/deployment.yml
kubectl apply -f sheepim-push-worker-service/service.yml

kubectl rollout restart deployment sheepim-push-worker-service-deployment
```


# 其他服务

## nextcloud

```bash


```