# Requirements

## Commun
- atom:
    - packages.txt
    - themes.txt
    - config.cson
    - .apmrc (?)
- tree
- ansible
- synaptic
- plank
- git
- python 2.7
- python-pip + packages:
  - fabric
- vim
  - .vimrc

## Maison
- skype
- nmap
- /home/seb/scripts
- vala appmenu
- xflux

## Boulot
(récupérer cette partie depuis GitLab)
- config ssh
  - .ssh/config
  - ssh completion
  - clé ssh
- proxy settings
  - bash http_proxy, apt:
    - export http_proxy = http://<user>:<passwd>@<proxy>:<port>
    - export https_proxy = https://<user>:<passwd>@<proxy>:<port>
    - variables à mettre dans ~/.bash_proxy
  - pip:
    - file ~/pip/pip.ini content:
      [global]
      proxy = https://<user>:<passwd>@<proxy>:<port>
  - paramétrage FF:
    - Préférences > Général > Param Proxy > Adresse de config auto du proxy > xyz proxy.pac
- .bashrc:
    - source ~/.bash_proxy
- terminator

## Manual tasks (check for possible automation)
- Plank
  - add to auto start => find /usr/share/applications -name "plank.desktop" -exec cp -p {} ~/.config/autostart/ \;
  - choose appli to put in
    - content of file ~/.config/plank/dock1/launchers/mate-terminal.dockitem:
      [PlankDockItemPreferences]
      Launcher=file:///usr/share/applications/mate-terminal.desktop
  
- FF settings multiples tabs on close
- Global Menu bar
  - (install = vala appmenu)
  - stop menu display in windows

## Special for VM: guest addition install
Menu de la VM > Periphériques > Insérer l'image CD des Additions invités
validations pour execution auto
reboot necessaire
