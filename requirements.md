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
- config ssh
  - .ssh/config
  - ssh completion
  - clé ssh
- proxy settings
  - bash http_proxy, apt, pip, paramétrage FF
- .bashrc
- terminator

## Manual tasks (check for possible automation)
- Plank
  - add to auto start => find /usr/share/applications -name "plank.desktop" -exec cp -p {} ~/.config/autostart/ \;
  - choose appli to put in
- FF settings multiples tabs on close
- Global Menu bar
  - (install = vala appmenu)
  - stop menu display in windows

## Special for VM: guest addition install
Menu de la VM > Periphériques > Insérer l'image CD des Additions invités
validations pour execution auto
reboot necessaire
