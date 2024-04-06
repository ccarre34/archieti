# ARCHIETI




Benvinguts la repositori de ARCHIETI, la distribució basada en Arch de l'institut Esteve Terradas i Illa (d'ara endavant, IETI)

Màquina virtual per testejar: https://drive.google.com/drive/folders/1klsb_Z6-Af73A2BXRJSxD3DP-bfc674X?usp=sharing

# Introducció

Aquesta personalització de Arch Linux està pensada per poder treballar als cicles formatius d'informàtica que impartim a IETI. Té el software mínim que fem servir (després ampliable segon les necessitats del professorat/alumnat).

La distro és un Archlinux base amb KDE. Tota la informació sobre Arch es troba a la seva wiki

https://wiki.archlinux.org/

Arch és un linux "rolling release", això vol dir que no canvia de versió, simplement actualitzem el que fem servir i el kernel.

El kernel que he escollit per ARCHIETI no és el kernel estàndar si no el linux_zen kernel, està "tunejat" per treballar millor amb gràfics entre altres avantatges.

En quant a la filosofia d'Arch Linux...

Arch es basa en el principi KISS

                Keep it simple, stupid!

La idea es mantenir el sistema el més simple i lleuger possible. 

# Escriptori

He escollit l'escriptori KDE (Versió 6, estrenada al març del 2024). L'he escollit per la seva capacitat de personalització principalment. En cas de necessitar altres escriptoris sempre es podrien afegir.

https://kde.org/es/announcements/megarelease/6/


# Sistema de fitxers BTRFS

El sistema de fitxers que utilitza la ARCHIETI és BTRFS (B-tree filesystem). És un sistema de fitxers modern, ja considerat estable basat en el copy-on-write. L'avantatge principal d'aquest sistema és la possibilitat de fer "snapshots" del sistema per poder restaurar qualsevol possible errada de l'usuari.

# Snapshots
 
 El sistema d'snapshots està configurat amb snapper + btrfs assistant (script 3.configuracio_snapshots.sh)

 he configurat una snapshot principal just el moment després de configurar tot el software (en qualsevol moment és pot fer alguna altra snapshot manual) i també he fet que es generin una snapshot pre i post qualsevol canvi que es faci al sistema (fins a un màxim de 10, es van autonetejant). 

 També està configurat per tal de que la carpeta de snapshots es carregui al propi GRUB del sistema per si ARCHIETI no és accessible per l'usuari. Des del grup podriem entrar en una de les imatges del sistema que funcionesin correctament i restaurar a un punt correcte. 

# Instal·lació, actualització i manteniment de paquets

El gestor de paquets nadiu de archlinux és "pacman". 

- Per instal·lar un paquet del repositori fariem:

        sudo pacman -S vmware_workstation

- Per desinstal·lar un paquet farem:

        sudo pacman -R vmware_workstation

- Per actualitzar tots els paquets farem:

        sudo pacman -Syu

Però un dels principals avantatges de arch és poder fer servir el AUR (arch user repository)

https://aur.archlinux.org/

Aquí es troben moltíssimes aplicacions i eines preparades per instal·lar a arch. La manera estàndar d'instal·lar les aplicacions de AUR és clonen la direccio del repositori i fent el build dle paquet. Per evitar això he configurat "yay" (script 1.install_yay.sh). Yay és un "ajudant" que ens facilitarà treballar amb AUR ja que automatitzarà la clonació del repositori i la seva construcció.

- Volem instal·lar "Android Studio", que no està a la maqueta base i no està al repositori oficial només hem de fer els següents passos:

        1- Buscar a AUR si existeix (https://aur.archlinux.org/packages/android-studio)
        2- yay -S android-studio

- En cas de voler desinstal·lar una aplicació de AUR es facilitarà

        yay -R <nom del paquet>

# Flatpak

He afegit que de sèrie ARCHIETI accepti paquets flatpak, els podeu instal·lar des de flathub https://flathub.org/ o des de la botiga d'aplicacions que teniu instal·lada "Discover"

# Sobre les actualitzacions...

Per actualitzar les aplicacions amb pacman ja ho hem vist, però no actualitzarà les aplicacions de AUR ni les flatpak.

Quan tenim aplicacions de diferents tipus, el correcte és fer servir yay per actualitzar, ja que buscarà TOTS els repositoris, fins i tot els de flatpak.

Us recomano actualitzar sempre amb:

        yay -Syu

