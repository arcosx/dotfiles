cat <<EOT > ~/.proxyenv.sh
#!/bin/sh
export proxyserveraddr=xxx.xxx.xxx.xxx
export proxyserverport=xxxx
# kubeadmin default. 
# 10.96.0.0/12 service cidr
# 10.244.0.0/16 pod network cidr
export kubernetescidr="10.96.0.0/12,10.244.0.0/16"
export HTTP_PROXY="http://$proxyserveraddr:$proxyserverport/"
export HTTPS_PROXY="http://$proxyserveraddr:$proxyserverport/"
export FTP_PROXY="http://$proxyserveraddr:$proxyserverport//"
export SOCKS_PROXY="http://$proxyserveraddr:$proxyserverport/"
export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com,$kubernetescidr,"
export http_proxy="http://$proxyserveraddr:$proxyserverport/"
export https_proxy="http://$proxyserveraddr:$proxyserverport/"
export ftp_proxy="http://$proxyserveraddr:$proxyserverport/"
export socks_proxy="http://$proxyserveraddr:$proxyserverport/"
export no_proxy="$kubernetescidr,localhost,127.0.0.1,localaddress,.localdomain.com,$kubernetescidr"
EOT

cat <<EOT > .unproxyenv.sh
#!/bin/sh
unset proxyserveraddr
unset proxyserverport
unset HTTP_PROXY
unset HTTPS_PROXY
unset FTP_PROXY
unset SOCKS_PROXY
unset NO_PROXY
unset http_proxy
unset https_proxy
unset ftp_proxy
unset socks_proxy
unset no_proxy
EOT