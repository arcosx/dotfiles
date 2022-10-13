curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# [option] set proxy for pull image
source ~/.proxyenv.sh
mkdir /etc/systemd/system/docker.service.d/
cat <<EOT > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=$HTTP_PROXY"
Environment="HTTPS_PROXY=$HTTPS_PROXY"
Environment="NO_PROXY=$NO_PROXY"
EOT
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl show --property=Environment docker
docker info | grep Proxy

