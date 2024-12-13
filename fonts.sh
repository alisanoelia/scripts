#!/bin/bash

if [ -d "$HOME/.fonts" ]; then
    echo "La carpeta ~/.fonts ya existe. Eliminándola..."
    rm -rf "$HOME/.fonts"
fi

echo "instalar fuentes"
mkdir $HOME/.fonts

cd $HOME/.fonts 
sudo xbps-install dejavu-fonts-ttf
sudo xbps-install fonts-roboto-ttf
# sudo xbps-install noto-fonts-emoji
sudo xbps-install wget xz

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/MartianMono.tar.xz

echo "Descomprimiendo las fuentes"
tar xvf JetBrainsMono.tar.xz
tar xvf NerdFontsSymbolsOnly.tar.xz
tar xvf MartianMono.tar.xz

fc-cache -f -v

clear

echo "---------------------------"
echo "+ se instalaron correctamente +"
echo "---------------------------"
