
echo "#!/bin/bash" > ~/update.sh
echo 'echo "running update..."' >> ~/update.sh
echo '# intenzionale 2 volte "apt-get autoremove -y"' >> ~/update.sh
echo "dpkg --configure -a && apt-get install -f && apt-get --purge autoremove && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y" >> ~/update.sh
echo 'echo "end update."' >> ~/update.sh
sudo mv ~/update.sh /usr/bin
sudo chmod +x /usr/bin/update.sh
echo "$USER ALL=(ALL) NOPASSWD:/usr/bin/update.sh" | sudo tee --append /etc/sudoers.d/$USER

# installa gawk (a volte non c'è) 
sudo apt install gawk -y 
#rimuove duplicati
sudo gawk -i inplace '!a[$0]++' /etc/sudoers.d/$USER

# add alias
echo "alias up='sudo update.sh'" | sudo tee --append ~/.bash_aliases
sudo gawk -i inplace '!a[$0]++' ~/.bash_aliases

echo "==============================================="
echo "RICORDA:  . ~/.bash_aliases"
echo 'alias "up" già pronto e aggiunto a sudoers'








