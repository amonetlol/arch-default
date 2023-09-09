#!/bin/sh
#source $(dirname "$0")/library.sh
# Nome do arquivo de log
log_file="default.log"

# Redireciona a saída padrão e a saída de erro padrão para o arquivo de log
exec > >(tee -a "$log_file") 2>&1

dir=$(pwd)
source $dir/library.sh

# ---- Yay ---- #
if sudo pacman -Qs git > /dev/null ; then
    echo "Git está instalado."
else
    echo "Instalando o git!"
    sudo pacman -Sy git --noconfirm
    clear
    echo "Yay instalado com sucesso!"
fi

# ---- Yay ---- #
if sudo pacman -Qs yay > /dev/null ; then
    echo "Yay está instalado."
else
    echo "Instalando o yay!"
    sudo pacman -Sy go
    git clone https://aur.archlinux.org/yay-git.git
    cd $dir/yay-git
    makepkg -si
    clear
    echo "Yay instalado com sucesso!"
fi

# ---- Instalado pacotes padrõese ---- #
echo "Instalando."

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
            echo "Instalando os drivers do VMware."
            sudo pacman -Sy open-vm-tools xf86-input-vmmouse xf86-video-vmware gtkmm3 fuse2 --noconfirm
            sudo systemctl enable vmtoolsd.service
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- SDDM ---- #
while true; do
    read -p "Deseja instalar o SDDM-Git? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo "Instalando o SDDM."
            yay -S sddm-git --noconfirm
            sudo systemctl enable sddm.service
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- Nemo ---- #
while true; do
    read -p "Deseja instalar o Nemo? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo "Instalando o Nemo."
            yay -S nemo nemo-emblems nemo-fileroller cinnamon-translations unrar unzip
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- Qtile ---- #
while true; do
    read -p "Deseja instalar o Qtile? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo "Instalando o Qtile."
            sudo pacman -S - < $dir/qtile.txt
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done

# ---- Hyprland ---- #
while true; do
    read -p "Deseja instalar o Hyprland? (Ss/Nn): " sn
    case $sn in
        [Ss]* )
            echo "Instalando o Hyprland."
            sudo pacman -S - < $dir/hyprland.txt
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Sim ou não.";;
    esac
done




