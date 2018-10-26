#!/bin/bash

# getting sudo rights
sudo -v

sudo apt-get install software-properties-common -yq
sudo apt-add-repository ppa:ansible/ansible -y

# prolonging sudo rights
sudo -v

# upgrading
sudo apt-get update -yq
sudo apt-get upgrade -yq

# install needed parts for launching ansible
sudo apt-get install git ansible -yq

#--- preliminary installations ~ 20 min ---


cd $HOME
git clone https://github.com/watysay/install_nvo_pc.git
cd install_nvo_pc

# prolonging sudo rights
sudo -v
ansible-playbook -i localhost, playbook.yml
