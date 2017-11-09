# README

readme d'installation d'un nouveau pc ou d'une nouvelle VM
* utilisable pour nvo pc
* utilisable pour install de VM
* utilisable pour Vagrant ?

---
## TODOs
- [x] Start project
- [ ] Add list of elements to save/reinstall
- [ ] Save config files for each elements
- [ ] Write execution file(s) for (each|all)

---
## HOWTO :
1. install git
2. cloner le repo
3. lancer le <fichier>.sh
(--> utiliser Ansible ?)

---
## create Ansible dir structure
mkdir -p new_project

cd new_project
#### inventory and master playbook
touch production staging site.yml 
#### folders
mkdir -p group_vars host_vars library filter_plugins
#### create role "common" with all the folders:
mkdir -p roles/common/{tasks,handlers,templates,files,vars,defaults,meta}

touch roles/common/{tasks,handlers,templates,files,vars,defaults,meta}/main.yml

(cf https://raymii.org/s/snippets/Ansible_-_create_playbooks_and_role_file_and_folder_structure.html)
