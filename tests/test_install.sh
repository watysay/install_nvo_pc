#!/bin/bash

# test suite of install_nvo_pc

# basic use : 
#   destroy machine if exists
#   create (up)
#   ssh in the machine
#   execute the bootstrap

# extended use :
#   first arg is passed directly to vagrant command

# v1 : 
#   once in machine, use alias "s" to connect to target user
#   and run "wget ..." command, etc
#   (execute standard proc for installing the machine)

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink -m $(dirname $0))
readonly ARGS="$@"

vagrant destroy -f \
  && vagrant up \
  && vagrant ssh -c 'bash -x bootstrap.sh |& tee play_$(date +%H%M%S).log'
