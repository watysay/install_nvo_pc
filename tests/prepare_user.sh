#!/bin/bash

# prepare_user
# meant to be run inside vagrant box

# Objective : 
#   create a user with sudo rights
#   whom needs a password for sudo

# Procedure :
#   create group + user (same name)
#   create home directory
#   add password = name
#   add su -l in vagrant .bashrc,
#   so when 'vagrant ssh', we auto connect to user

# remember : those jobs are run as root !
#### vars ####

user=${1:testuser}

#### operations ####

echo "creating user ${user} ..."

# trying idempotence
if grep -q "^${user}\b" /etc/passwd ; then
  # user already exists
  echo "user already exists, proceeding ..."
else
  groupadd "${user}" \
    && useradd \
      --create-home \
      --shell /bin/bash \
      --gid "${user}" \
      --groups sudo \
      "${user}" \
    && echo "user was created, proceeding ..."
fi


# on all cases, change password
echo -e "${user}\n${user}" | passwd "${user}" >/dev/null 2>&1
# su to user in .bashrc : commented
#+because it crash other launches and/or "vagrant provision"
#instead, make it an alias
grep "sudo su -l ${user}" /home/vagrant/.bashrc \
  || echo "alias s='sudo su -l ${user}'" >> /home/vagrant/.bashrc

# end of install
