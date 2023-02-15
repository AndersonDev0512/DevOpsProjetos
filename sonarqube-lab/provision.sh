/usr/bin/bash
useradd sonar
yum  install wget unzip java-11-openjdk-devel -y 
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
unzip sonarqube-9.9.0.65466.zip -d /opt/
mv /opt/sonarqube-9.9.0.65466 /opt/sonarqube
sudo chown -R sonar:sonar /opt/sonarqube
sudo touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
sudo cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description = Sonarqube Service 
after=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
service sonar start