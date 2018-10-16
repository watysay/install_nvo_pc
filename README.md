# README

readme d'installation d'un nouveau pc ou d'une nouvelle VM
* utilisable pour nvo pc
* utilisable pour install de VM
* utilisable pour Vagrant ?

---
## TODOs
- [x] Start project
- [x] Add list of elements to save/reinstall
- [x] ultra simple bootstrap
- [ ] taggé les playbooks par type, puis filtre par tag sur le bootstrap
- [ ] write export process
- [ ] Save config files for each elements
  - [ ] Create folder ~/.bash containing all vars + call in .bash rc/\_profile
- [ ] Write execution file(s) for (each|all)
- ~~  voir ansible-pull (/!\ semble buggé)~~

---
## HOWTO :
Install: wget -O- https://raw.githubusercontent.com/watysay/install_nvo_pc/master/bootstrap.sh | bash

---
## BASIQUE
bootstrap.sh update/upgrade le system

il télécharge ensuite git et ansible, clone ce repo

lance ansible avec:

fichier host avec \[local\]localhost

fichier playbook.yml avec hosts:local connection:local

run: ansible-playbook -i hosts playbook.yml --ask-become-pass
