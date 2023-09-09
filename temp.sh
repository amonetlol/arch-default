#!/bin/sh
#
if pacman -Q htop >/dev/null 2>&1; then
	echo "O htop está instalado no sistema."
else
	while true; do
		read -p "Deseja instalar o htop (Ss/Nn): " sn
		case $sn in
		[Ss]*)
			echo "htop."
			echo $'\n'
			sudo pacman -Sy htop --noconfirm
			echo "Sucesso"
			echo $'\n'
			break
			;;
		[Nn]*)
			#exit;
			break
			;;
		*) echo "Sim ou não." ;;
		esac
	done
fi
