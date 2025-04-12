#!/bin/sh
# Add Docker's official GPG key:
sudo apt-get update
if [ $? -eq 0 ]; then
else
  echo "====now install 'sudo'===="
  apt-get uddate
  if [ $? -eq 0 ]; then
    echo "please use root user install sudo and then try it again!"
    exit 1
  fi
  apt-get install sudo -y 		
fi
sudo apt-get install -y 'ca-certificates' 'curl'
sudo install -m 0777 -d /etc/apt/keyrings
echo '----------------------------------------------------------------------'
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc 
echo '----------------------------------------------------------------------'
chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y 'docker-ce' 'docker-ce-cli' 'containerd.io' 'docker-buildx-plugin' 'docker-compose-plugin'
echo
echo
echo 'docker and compose was installed now.'
echo '----------------------------------------------------------------------'
echo
sudo docker -v
echo
echo
sudo docker compose version
echo
echo
echo
