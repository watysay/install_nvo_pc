#!/bin/bash

# bootstrap.sh

# bootstrap the installation of the pc

# installs git ansible
# clone the repo
# launch ansible

set -e # stop on failure, so I can relaunch

### vars ###
git_repo="https://github.com/watysay/install_nvo_pc.git"
install_dir="$HOME/install_nvo_pc"

### args ###
branch=${1:-"master"}

### functions ###
get_distro_info(){ 
  if [[ -e /etc/os-release ]]; then
    . /etc/os-release
    rc=$?
  else
    rc=1
  fi
  return $rc
}

isUbuntu(){
  if get_distro_info; then
    return [[ $ID = "ubuntu" ]]
  else
    return 1
  fi
}

getUbuntuVersion(){ 
  get_distro_info \
    && echo "$VERSION_ID" \
    || echo ""
} 


### main ###

# getting sudo rights
sudo -v

sudo apt-get install software-properties-common -yq
# add repo for latest ansible
# not working for ubuntu > 20
[[ $(getUbuntuVersion) = 20* ]] \
  || sudo apt-add-repository ppa:ansible/ansible -y

# add repo for latest git
sudo apt-add-repository ppa:git-core/ppa -y

# prolonging sudo rights
sudo -v

# upgrading
sudo apt-get update -qq
sudo apt-get upgrade -qq

# install needed parts for launching ansible
sudo apt-get install git ansible -qq

#--- preliminary installations ~ 20 min ---
if [[ -f playbook.yml ]]; then
  # if the playbook is in the directory => play without clone
  echo "Playbook exists, launching ..."
else
  git clone ${git_repo} ${install_dir}
  cd ${install_dir}
  if ! git checkout "${branch}"; then
    echo "
    This branch does not exists
    Please checkout a real branch before launching the job"
    exit 1
  fi
fi
# prolonging sudo rights
sudo -v
ansible-galaxy install geerlingguy.docker,3.0.0
ansible-playbook -i inventory playbook.yml
