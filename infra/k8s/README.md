# K8s 集群

单节点 control-plane（`master-node`）初始化、Flannel 网络与 metrics-server。

## 初始化

```bash
sudo hostnamectl set-hostname master-node

sudo kubeadm init \
  --control-plane-endpoint=master-node \
  --upload-certs \
  --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers \
  --pod-network-cidr=10.244.0.0/16 \
  -v=5

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes master-node node-role.kubernetes.io/control-plane:NoSchedule-
kubectl apply -f infra/k8s/kube-flannel.yml
kubectl apply -f infra/k8s/metric.yml
```

## 排障 / 重置

```bash
sudo systemctl stop kubelet
sudo kubeadm reset -f
sudo rm -rf /etc/cni/net.d /etc/kubernetes /var/lib/etcd ~/.kube

sudo kubeadm init \
  --control-plane-endpoint=master-node \
  --upload-certs \
  --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers \
  --pod-network-cidr=10.244.0.0/16 \
  -v=5

sudo ctr -n k8s.io images tag \
  registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:v1.31.2 \
  registry.k8s.io/kube-apiserver:v1.31.2

sudo ctr -n k8s.io images tag \
  registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.10 \
  registry.k8s.io/pause:3.10

sudo journalctl -u kubelet -e
```

## Busybox 测试

创建一个存活约 1 小时的 busybox Pod，用于临时测试命令：

```bash
kubectl run busybox-test \
  --image=swr.cn-north-4.myhuaweicloud.com/ddn-k8s/gcr.io/google-containers/busybox:latest \
  --image-pull-policy=IfNotPresent \
  --restart=Never -- sleep 3600

kubectl exec -it busybox-test -- sh
kubectl describe pods busybox-test
kubectl delete pod busybox-test
```
