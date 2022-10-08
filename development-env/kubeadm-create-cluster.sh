# Reference: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

#####################################################################################################################
# close VM Swap
sudo swapoff -a  
rm /swap.img
vim /etc/fstab
[DELETE] /swap
#####################################################################################################################

# forwarding IPv4 and letting iptables see bridged traffic
# Reference: https://kubernetes.io/docs/setup/production-environment/container-runtimes/#forwarding-ipv4-and-letting-iptables-see-bridged-traffic

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# apply sysctl params without reboot
sudo sysctl --system

#####################################################################################################################

# clean proxy again
source ~/.unproxyenv.sh
kubeadm init --pod-network-cidr=10.244.0.0/16 --cri-socket unix:///run/containerd/containerd.sock


#####################################################################################################################

# [option]copy kubeconfig
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# install flannel
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml

# all master scheduler
kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-

kubectl run myshell1 -it --rm --image busybox -- sh
hostname -i
ping <hostname myshell2>

kubectl run myshell2 -it --rm --image busybox -- sh
hostname -i
ping <hostname myshell1>