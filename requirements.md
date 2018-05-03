# Requirements

## Commun

### packages
- [x] atom ( wget URL -O atom.deb && sudo dpkg -i atom.deb )
- [x] tree
- [x] ansible
- [x] synaptic
- [x] plank
- [x] git
- [x] python 2.7
- [x] python-pip + packages:
  - fabric
- [x] vim

### fichiers à copier
- [x] .bashrc
  - décommenter "#force_color_prompt=yes" ligne 46 de .bashrc
  - ou copier un fichier
- [ ] atom:
  - packages.txt
  - themes.txt
  - config.cson
  - .apmrc (?)
- [ ] git prompt
  - source file /usr/lib/git-core/git-sh-prompt
    in /etc/bash_completion.d/git-prompt
    (which is sourced throught .bashrc)
- [ ] git completion
  - add https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
    to /etc/bash_completion.d/
- [ ] .vimrc
- [ ] favoris FF/Chrome

## Maison
- [ ] skype
- [ ] nmap
- [ ] /home/seb/scripts
- [ ] vala appmenu
- [ ] xflux

## Boulot
(récupérer cette partie depuis GitLab)
- [ ] config ssh interne
  - clé ssh
  - uploader to GitLab (manual)
- [ ] config ssh vers autres serveurs
  - .ssh/config
  - ssh completion
- [ ] proxy settings
  - bash http_proxy:
    ```
    $ export http_proxy = http://$user:$passwd@$proxy:$port
    $ export https_proxy = https://$user:$passwd@$proxy:$port
    ```
    variables à mettre dans ~/.bash_proxy
  - apt:
    - nv fichier /etc/apt/apt.conf.d/99-proxy-setup, contenant
      ```
      Acquire::http::Proxy "http://$user:$passwd@$proxy:$port";
      ```
  - pip:
    - pip respects $http_proxy and $https_proxy settings
    - otherwise, file ~/pip/pip.ini content:
      ```
      [global]
      proxy = https://$user:$passwd@$proxy:$port
      ```
  - paramétrage FF:
    - Préférences > Général > Param Proxy > Adresse de config auto du proxy > xyz proxy.pac
  - atom:
    ```
    $ apm config set proxy $http_proxy (valeur issue de .bash_proxy)
    $ apm config set https_proxy $https_proxy (valeur issue de .bash_proxy)
    ```
  - _note_: 
    - git clone https not working w/ proxy
    - no copy ssh key on github :/
- [ ] .bashrc:
    - source ~/.bash_proxy
- [ ] terminator
- [ ] Favoris FF
  - copier un fichier HTML
- [ ] ajouter les partages réseau
  - sudo vi /etc/fstab, ajouter une ligne 
    ```
    //IP/path to folder/ <mount point>   cifs _netdev,gid=<share group>,dir_mode=0775,file_mode=0775,credentials=<some path>/.smbcredentials 0 0
    ```
  - créer le fichier <path>/.smbcredentials, ajouter les deux lignes
    ```
    username=IDENTIFIANT
    password=MOTDEPASSE
    ```
    (remplacer avec les bonnes valeurs)

- [ ] ajouter les imprimantes
- [ ] installer sqldeveloper
    - copier le dossier sqldeveloper depuis C:/.../ dans /opt
    - installer openjdk 1.7 ou 1.8 (warning sur 1.8)
       ```
       sudo apt-get install openjdk-8-jdk
       ```
       - (chemin d'installation : /usr/lib/jvm/java-8-openjdk-amd64)
    - suivre les extras steps (5 -> 8) de https://askubuntu.com/questions/458554/how-to-install-sql-developer-on-ubuntu-14-04
      (lien symbolique + modif du lanceur + raccourci application)

## Manual tasks (check for possible automation)
- [ ] Plank
  - add to auto start 
    ```
    find /usr/share/applications -name "plank.desktop" -exec cp -p {} ~/.config/autostart/ \;
    ```
  - choose appli to put in
    - content of file ~/.config/plank/dock1/launchers/mate-terminal.dockitem:
      ```
      [PlankDockItemPreferences]
      Launcher=file:///usr/share/applications/mate-terminal.desktop
      ```
  
- [ ] FF settings : close multiple tabs = no warning
  - about:config page:
      ```
      browser.tabs.warnOnCloseOtherTabs -> False
      browser.tabs.warnOnClose -> False 
      ```
- [ ] Global Menu bar
  - (install = vala appmenu)
  - stop menu display in windows

## Special for VM: guest addition install
pour virtualbox:

Menu de la VM > Periphériques > Insérer l'image CD des Additions invités
validations pour execution auto

pour vmware:
installer les packages
- open-vm-tools
- open-vm-tools-desktop

reboot necessaire

## Notes
virtualbox:
"http://download.virtualbox.org/virtualbox/5.2.0/virtualbox-5.2_5.2.0-118431~Ubuntu~{{ ansible_distribution_release }}_amd64.deb

atom:
https://atom.io/download/deb

vagrant:
https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.deb
