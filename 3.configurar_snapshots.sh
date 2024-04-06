#!/bin/bash


echo "Ara hem de preparar els submoduls de les snapshots:"

#Desmuntar i esborrar la carpeta snapshots creada amb la installacio

sudo umount /.snapshots
sudo rm -r /.snapshots

sudo pacman -S snapper
#Evitar error de subvolids quan intentem restaurar una snapshot
sudo sed -i 's/subvolid=.*,//' /etc/fstab

sudo snapper -c root create-config /

yay -S snapper-support btrfs-assistant
