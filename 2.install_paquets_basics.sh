#!/bin/bash
#!/bin/bash

# Comprova si l'script s'està executant com a root
if [ "$(id -u)" -ne 0 ]; then
  echo "Si us plau, executa com a root"
  exit 1
fi

# Instal·la els paquets utilitzant yay
yay -S --noconfirm arduino-ide-bin blender-3.6-bin google-chrome gimp-git gns3-gui

# Instal·la vmware-workstation des dels repositoris oficials
pacman -S --noconfirm vmware-workstation

echo "Paquets instal·lats amb èxit."


