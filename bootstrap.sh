#!/bin/bash

sudo apt-get update -yq && \
sudo apt-get upgrade -yq

sudo apt-get install git ansible -yq
cd $HOME
git clone https://github.com/watysay/install_nvo_pc.git
cd install_nvo_pc
ansible-playbook -i hosts playbook.yml --ask-become-pass
