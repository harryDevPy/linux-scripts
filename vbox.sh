
echo "NON USARE SUDO - solo: sh vbox.sh"
u="$USER"
sudo cp /media/$u/VBox_GAs*/VBoxLinuxAdditions.run ~/
sudo sh /home/$u/VBoxLinuxAdditions.run
