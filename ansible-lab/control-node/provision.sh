#/bin/sh 
sudo yum -y install epel-release
echo "inicio da instalacao do ansible"
sudo yum -y install ansible 
sudo cat <<EOT >> /etc/hosts
192.168.56.12 control-node
192.168.56.13 app01
192.168.56.14 db01
EOT 
sudo yum install -y nfs-utils 
echo "inicio da instalação do nfs"