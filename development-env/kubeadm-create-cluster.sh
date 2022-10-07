kubeadm config images pull
# [Option] See the containerd status
systemctl status containerd.service
# [Option] Check containerd images
ctr -n k8s.io images ls

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.133.130 \
--cri-socket unix:///run/containerd/containerd.sock

# Copy kubeconfig
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
