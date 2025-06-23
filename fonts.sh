#!/bin/bash

VERSION="v3.4.0"

if [ -d "$HOME/.fonts" ]; then
	echo "La carpeta ~/.fonts ya existe. Eliminándola..."
	rm -rf "$HOME/.fonts"
fi

printf "Instalar fuentes \n"
mkdir $HOME/.fonts

cd $HOME/.fonts
sudo xbps-install dejavu-fonts-ttf
sudo xbps-install fonts-roboto-ttf
sudo xbps-install noto-fonts-emoji
sudo xbps-install wget xz

wget https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/JetBrainsMono.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/NerdFontsSymbolsOnly.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/MartianMono.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/GeistMono.tar.xz

printf "Descomprimiendo las fuentes \n"

tar xvf JetBrainsMono.tar.xz
tar xvf NerdFontsSymbolsOnly.tar.xz
tar xvf MartianMono.tar.xz
tar xvf GeistMono.tar.xz

fc-cache -f -v

printf """
-------------------------------
+ se instalaron correctamente +
-------------------------------
"""
