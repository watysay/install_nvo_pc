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
  - [x] Add echo to bootstrap (execution steps)
  - [ ] Add time to bootstrap
- [ ] taggé les playbooks par type, puis filtre par tag sur le bootstrap (ask which installation)
- [ ] Write execution file(s) for (each|all)
  - [x] Add config atom
  - [ ] Add dotfiles installation
    - [x] Repo clone
	- [ ] backup ~/.bashrc, ~/.atom/config.cson
    - [x] Stow stuff
  - [ ] Add common-SSH key creation
  - [ ] Add common-SSH key push to github ?
  - [ ] Add common-rewrite repo URL ?
  - [ ] Add laptop-docker
  - [ ] Add laptop-vagrant
  - [ ] Add laptop-battery ?

---
## HOWTO :
Install: wget https://raw.githubusercontent.com/watysay/install_nvo_pc/master/bootstrap.sh && bash bootstrap.sh

---
## BASIQUE
bootstrap.sh update/upgrade le system</br>
il télécharge ensuite git et ansible, clone ce repo</br>
lance ansible avec:</br>
fichier playbook.yml avec hosts:localhost connection:local</br>
run: ansible-playbook -i localhost, playbook.yml</br>
(pas besoin de sudo car déjà utilisé par apt)

---
### TODOs post-install
- [ ] Créer une clé SSH ?

BEfore dotfiles part, remove ~/.bashrc & ~/.atom/config.cson
- rewrite https url to git@
git remote set-url origin $(git remote get-url origin | sed 's;https://;git@;')
