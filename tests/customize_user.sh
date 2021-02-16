#!/bin/bash

# customize user 
# given a user, populate data so it looks like
# a real user ...

user=${1?"No user given, aborting ..."}

# keep bashrc as is

echo "Creating directories ..."
sudo mkdir -p /home/${user}/{Desktop,Documents,Downloads,Images,Music,.ssh}

# do that last
sudo chown -R ${user}:${user} /home/${user}

