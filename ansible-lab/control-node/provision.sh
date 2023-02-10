#/bin/sh
sudo yum -y install epel-release
echo "inicio da instalacao do ansible"
sudo yum -y install ansible
cat <<EOT >> /etc/'hosts'
192.168.56.12 control-node
192.168.56.13 app01
192.168.56.14 db01
EOT
sudo ansible-galaxy install geerlingguy.mysql