#!/bin/bash

echo '++++++++'
echo INFO: Sposta lo script in /usr/bin e lo aggiunge ai sudoers
echo '++++++++'


if [ -z $1  ]
    then
        echo '#######################################################'
        echo Hai dimenticato il path dello scritp.
        echo syntax: 
        echo sudoers.sh /path/script.sh
        echo '#######################################################'
    else
        
        FILE=$1
        f="$(basename -- $FILE)"
        echo "$f"     
        echo "script copiato in /usr/bin/"
        sudo cp $FILE /usr/bin/
        echo "rende eseguibile con chmod +x"
        sudo chmod +x /usr/bin/$f
        echo "$USER  ALL=(ALL) NOPASSWD:/usr/bin/$f" | sudo tee --append /etc/sudoers.d/$USER
        # rimuove duplicati
        sudo gawk -i inplace '!a[$0]++' /etc/sudoers.d/$USER
fi

