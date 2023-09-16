#!/bin/sh

dir=$(pwd) 

# Nome do arquivo de log
log_file="5.log"

# Redireciona a saída padrão e a saída de erro padrão para o arquivo de log
exec > >(tee -a "$log_file") 2>&1


echo "Grub"
pacman -S grub efibootmgr --noconfirm --needed


if [[ -d "/sys/firmware/efi" ]]; then
    grub-install --target=i386-pc --recheck /dev/sda1
elseif
    grub-install --target=x86_64-efi --efi-directory=/boot/efi
fi

grub-mkconfig -o /boot/grub/grub.cfg

$dir/6.finish.sh


