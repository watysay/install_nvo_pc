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
    - export http_proxy = http://$user:$passwd@$proxy:$port
    - export https_proxy = https://$user:$passwd@$proxy:$port
    - variables à mettre dans ~/.bash_proxy
  - apt:
    - nv fichier /etc/apt/apt.conf.d/99-proxy-setup
      - contenu = Acquire::http::Proxy "http://$user:$passwd@$proxy:$port";
  - pip:
    - pip respects $http_proxy and $https_proxy settings
    (- file ~/pip/pip.ini content:
      [global]
      proxy = https://$user:$passwd@$proxy:$port)
  - paramétrage FF:
    - Préférences > Général > Param Proxy > Adresse de config auto du proxy > xyz proxy.pac
  - atom:
    - $ apm config set proxy $http_proxy (valeur issue de .bash_proxy)
    - $ apm config set https_proxy $https_proxy (valeur issue de .bash_proxy)
  - _note_: 
    - git clone https not working w/ proxy
    - no copy ssh key on github :/
- [ ] .bashrc:
    - source ~/.bash_proxy
- [ ] terminator
- [ ] Favoris FF
  - copier un fichier HTML
- [ ] ajouter les partages réseau
- [ ] ajouter les imprimantes

## Manual tasks (check for possible automation)
- [ ] Plank
  - add to auto start => find /usr/share/applications -name "plank.desktop" -exec cp -p {} ~/.config/autostart/ \;
  - choose appli to put in
    - content of file ~/.config/plank/dock1/launchers/mate-terminal.dockitem:
      [PlankDockItemPreferences]
      Launcher=file:///usr/share/applications/mate-terminal.desktop
  
- [ ] FF settings : close multiple tabs = no warning
  - about:config page:
      - browser.tabs.warnOnCloseOtherTabs -> False
      - browser.tabs.warnOnClose -> False 
- [ ] Global Menu bar
  - (install = vala appmenu)
  - stop menu display in windows

## Special for VM: guest addition install
Menu de la VM > Periphériques > Insérer l'image CD des Additions invités
validations pour execution auto
reboot necessaire
