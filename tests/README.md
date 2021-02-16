README

testons l'install nouveau pc

1. installer vagrant
sinstall vagrant virtualbox

2. ajouter la box ubuntu/focal64
  - 3 facons de faire :
    - vagrant box add ubuntu/focal64
    - vagrant init ubuntu/focal64 + vagrant up 
    - vagrant init + ajouter 
        config.vm.box = "ubuntu/focal64"
      à la place du test

3. provisionner la machine afin d'avoir un user
   config.vm.provision "shell", inline: <<-SHELL
     groupadd seb
     useradd --create-home --gid seb --groups sudo seb
   SHELL



4. connexion à la machine
vagrant ssh

vagrant destroy -f && vagrant up && vagrant ssh

5. creation du mot de passe pour sudo 
echo -e "seb\nseb" | sudo passwd seb
su -l seb

echo 'sudo su -l seb' > /home/vagrant/.bashrc
=> connexion suivante, on va directement sous user seb,
   qui a besoin d'un mdp pour passer sudo
=> ça ne marche pas, cela bloque tout nouveau deploiement 
    (autre script et/ou vagrant provision)
     
TODO: créer un .sh qui prend un nom de user en param 1,
  qui créer un vagrantfile et un .bashrc
  executer le sh => ssh dans la boite en tant que user.
  
6. tester l'install nvo pc
wget https://raw.githubusercontent.com/watysay/install_nvo_pc/devel/rework/bootstrap.sh
