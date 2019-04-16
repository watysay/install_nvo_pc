#!/bin/bash

git_repo="https://github.com/watysay/install_nvo_pc.git"
install_dir="$HOME/install_nvo_pc"

# getting sudo rights
sudo -v

sudo apt-get install software-properties-common -yq
# add repo for latest ansible
sudo apt-add-repository ppa:ansible/ansible -y
# add repo for latest git
sudo apt-add-repository ppa:git-core/ppa -y

# prolonging sudo rights
sudo -v

# upgrading
sudo apt-get update -yq
sudo apt-get upgrade -yq

# install needed parts for launching ansible
sudo apt-get install git ansible -yq

#--- preliminary installations ~ 20 min ---

git clone ${git_repo} ${install_dir}
cd ${install_dir}

# prolonging sudo rights
sudo -v
ansible-playbook -i localhost, playbook.yml
