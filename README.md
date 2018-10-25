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
  - [ ] Add echo to bootstrap (execution steps)
  - [ ] Add time to bootstrap
- [ ] taggé les playbooks par type, puis filtre par tag sur le bootstrap (ask which installation)
- [ ] Add submodule for dotfiles.git
- [ ] Write execution file(s) for (each|all)
  - [ ] Add config atom
  - [ ] Add dotfiles installation
  - [ ] Add laptop-docker
  - [ ] Add laptop-vagrant
  - [ ] Add laptop-battery ?

---
## HOWTO :
Install: wget -O bootstrap.sh https://raw.githubusercontent.com/watysay/install_nvo_pc/master/bootstrap.sh && bash bootstrap.sh

---
## BASIQUE
bootstrap.sh update/upgrade le system</br>
il télécharge ensuite git et ansible, clone ce repo</br>
lance ansible avec:</br>
fichier host avec \[local\]localhost</br>
fichier playbook.yml avec hosts:local connection:local</br>
run: ansible-playbook -i hosts playbook.yml --ask-become-pass</br>
