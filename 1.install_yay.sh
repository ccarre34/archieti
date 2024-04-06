#!/bin/bash

# Comprova si l'script s'està executant com a root
if [ "$(id -u)" -ne 0 ]; then
  echo "Si us plau, executa com a root"
  exit 1
fi

# Instal·la base-devel si encara no està instal·lat
pacman -Qq base-devel || pacman -Sy --noconfirm base-devel

# Instal·la git si encara no està instal·lat
pacman -Qq git || pacman -Sy --noconfirm git

# Crea un directori temporal per a la instal·lació
temp_dir=$(mktemp -d)

# Clona el repositori yay
git clone https://aur.archlinux.org/yay.git "$temp_dir"

# Canvia el directori a yay
cd "$temp_dir/yay"

# Construeix i instal·la yay
makepkg -si --noconfirm

# Neteja
rm -rf "$temp_dir"
