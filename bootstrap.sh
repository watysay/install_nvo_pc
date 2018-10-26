#!/bin/bash


sudo apt-get update -yq
sudo apt-get install software-properties-common -yq
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -yq
sudo apt-get upgrade -yq

sudo apt-get install git ansible -yq

cd $HOME
git clone https://github.com/watysay/install_nvo_pc.git
cd install_nvo_pc
ansible-playbook -i localhost, playbook.yml --ask-become-pass
