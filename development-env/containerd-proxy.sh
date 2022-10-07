mkdir /etc/systemd/system/containerd.service.d
cat <<EOT >> /etc/systemd/system/containerd.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=$HTTP_PROXY"
Environment="HTTPS_PROXY=$HTTPS_PROXY"
Environment="NO_PROXY=$NO_PROXY"
EOT
rm /etc/containerd/config.toml
sudo systemctl daemon-reload
systemctl restart containerd
sudo systemctl show --property=Environment containerd
systemctl status containerd.service