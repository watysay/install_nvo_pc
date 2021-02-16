#!/bin/bash

# test suite of install_nvo_pc

# basic use : 
#   destroy machine if exists
#   create (up)
#   ssh in the machine

# extended use :
#   first arg is passed directly to vagrant command

# v1 : 
#   once in machine, use alias "s" to connect to target user
#   and run "wget ..." command, etc
#   (execute standard proc for installing the machine)

ARGS="$@"
cmd="$1"

create_try_script(){
  b_name=$(git branch --show-current)
  cat <<EOF > try.sh
wget https://raw.githubusercontent.com/watysay/install_nvo_pc/${b_name}/bootstrap.sh
bash bootstrap.sh ${b_name}
EOF
  chmod u+x try.sh
}

if [[ -n ${cmd} ]]; then
  vagrant "${cmd}"
else
  create_try_script
  vagrant destroy -f \
    && vagrant up \
    && vagrant ssh -c './try.sh'

fi
