#!/bin/sh
#source $(dirname "$0")/library.sh
# Nome do arquivo de log
log_file="default.log"

# Redireciona a saída padrão e a saída de erro padrão para o arquivo de log
exec > >(tee -a "$log_file") 2>&1

dir=$(pwd)
source $dir/library.sh

# Set color
yellow="\e[1;33m]"
reset_cor="\e[0m]"

echo -e "${yellow}--------------------------------------------${reset_cor}"
echo $'\n'
echo -e "${yellow}Atualizando chaves do Archlinux. ${reset_cor}"
echo $'\n'

sudo pacman -Sy archlinux-keyring --noconfirm

# ---- Yay ---- #
if sudo pacman -Qs git > /dev/null ; then
    echo -e "${yellow}Git está instalado. ${reset_cor}"
    echo $'\n'
else
    echo "${yellow}Instalando o git!${reset_cor}"
    echo $'\n'
    sudo pacman -Sy git --noconfirm
    clear
    echo -e "${yellow}Git instalado com sucesso! ${reset_cor}"
    echo $'\n'
fi

# ---- Yay ---- #
if sudo pacman -Qs yay > /dev/null ; then
    echo -e "${yellow}Yay está instalado. ${reset_cor}"
    echo $'\n'
else
    echo -e "${yellow}Instalando o yay! ${reset_cor}"
    echo $'\n'
    sudo pacman -Sy go --noconfirm
    #git clone https://aur.archlinux.org/yay-git.git
    git clone https://aur.archlinux.org/yay-bin.git
    cd $dir/yay-bin
    makepkg -si
    clear
    echo -e "${yellow}Yay instalado com sucesso! ${reset_cor}"
    echo $'\n'
fi

# ---- Instalado pacotes padrõese ---- #
echo -e "${yellow}Instalando os pacotes. ${reset_cor}"
echo $'\n'

packagesPacman=(
  "neovim"
  "ttf-cascadia-code-nerd"
  "ttf-roboto"
  "ttf-hack-nerd"
  "ttf-firacode-nerd"
  "ttf-fantasque-nerd"
  "ttf-fantasque-sans-mono"
  "ttf-font-awesome"
  "ttf-jetbrains-mono"
  "ttf-jetbrains-mono-nerd"
  "ttf-ubuntu-font-family"
  "adobe-source-sans-fonts"
  "evince"
  "gvfs"
  "ranger"
  "viewnior"
  "xdg-user-dirs"
  "wget"
  "udisks2"
);

packagesYay=(
  "exa"
  "google-chrome"
  "otf-raleway"
  "pfetch"
  "ttf-intel-one-mono"
  "ttf-iosevka"
  "awesome-terminal-fonts"
);

_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";

# ---- VMware ---- #
while true; do
    read -p "Deseja instalar os drivers do VMware? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo -e "{yellow}Instalando os drivers do VMware. ${reset_cor}"
            echo $'\n'
            sudo pacman -Sy open-vm-tools xf86-input-vmmouse xf86-video-vmware gtkmm3 fuse2 --noconfirm
            echo -e "${yellow}Iniciando o serviço vmtoolsd. ${reset_cor}"
            echo $'\n'
            sudo systemctl enable vmtoolsd.service
        break;;
        [Nn]* ) 
            #exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- SDDM ---- #
while true; do
    read -p "Deseja instalar o SDDM-Git? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo -e "${yellow}Instalando o SDDM. ${reset_cor}"
            echo $'\n'
            yay -S sddm-git --noconfirm
            echo -e "${yellow}Iniciando o serviço SDDM. ${reset_cor}"
            echo $'\n'
            sudo systemctl enable sddm.service
        break;;
        [Nn]* ) 
            #exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- Nemo ---- #
while true; do
    read -p "Deseja instalar o Nemo? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo -e "${yellow}Instalando o Nemo. ${reset_cor}"
            echo $'\n'
            yay -S nemo nemo-emblems nemo-fileroller cinnamon-translations unrar unzip --noconfirm
        break;;
        [Nn]* ) 
            #exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- Qtile ---- #
while true; do
    read -p "Deseja instalar o Qtile? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo -e "${yellow}Instalando o Qtile. ${reset_cor}"
            echo $'\n'
            sudo pacman -S - < $dir/qtile.txt
        break;;
        [Nn]* ) 
            #exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- Hyprland ---- #
while true; do
    read -p "Deseja instalar o Hyprland? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo -e "${yellow}Instalando o Hyprland. ${reset_cor}"
            echo $'\n'
            sudo pacman -S - < $dir/hyprland.txt
        break;;
        [Nn]* ) 
            #exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done




