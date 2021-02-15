#!/bin/bash

# bootstrap.sh

# bootstrap the installation of the pc

# installs git ansible
# clone the repo
# launch ansible

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
sudo apt-get update -yq
sudo apt-get upgrade -yq

# install needed parts for launching ansible
sudo apt-get install git ansible -yq

#--- preliminary installations ~ 20 min ---

git clone ${git_repo} ${install_dir}
cd ${install_dir}
if ! git checkout "${branch}"; then
  echo "
  This branch does not exists
  Please checkout a real branch before launching the job"
  exit 1
fi

# prolonging sudo rights
sudo -v
ansible-playbook -i localhost, playbook.yml
