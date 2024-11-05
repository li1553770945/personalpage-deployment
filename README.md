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