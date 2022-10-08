# Setting up my development environment

Environment configuration in the absence of a healthy network environment.

In fact, I do not need to wipe this shit.

## Basic
* [`proxy.sh`](./proxy.sh) Set Proxy.
* [`zsh.sh`](./zsh.sh) Install Zsh,ohmyzsh,fzf.
* [`ssh.sh`](./ssh.sh) Generate SSH public key.
* [`github.sh`](./github.sh) Install Github CLI and add SSH public key.
    * https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt
* [`download-vs-code-server.sh`](./download-vs-code-server.sh) Linux script to download latest VS Code Server
    * https://gist.github.com/b01/0a16b6645ab7921b0910603dfb85e4fb

### Cloud Native
#### Go
* [`go-zsh.sh`](./go-zsh.sh) Install Go,gvm(Go Version Manager) and setting Zsh.
    * https://github.com/udhos/update-golang
    * https://github.com/moovweb/gvm#installing-go

#### Pure Kubernetes
* [`containerd.sh`](./containerd.sh) Set containererd,runc,CNI.
* [`kubeadm.sh`](./kubeadm.sh) Install kubeadm.
* [`kubeadm-create-cluster.sh`](./kubeadm-create-cluster.sh) Creating a cluster with kubeadm.

#### Docker
* [`docker.sh`](./docker.sh) Install Docker
    * https://github.com/docker/docker-install