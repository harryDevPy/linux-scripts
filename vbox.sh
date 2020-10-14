
echo "\nNON USARE SUDO - solo: sh vbox.sh\n"
u="$USER"
sudo cp /media/$u/VBox_GAs*/VBoxLinuxAdditions.run ~/
sudo sh /home/$u/VBoxLinuxAdditions.run
sudo rm  ~/VBoxLinuxAdditions.run
