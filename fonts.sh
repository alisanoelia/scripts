#!/bin/bash

if [ -d "$HOME/.fonts" ]; then
    echo "La carpeta ~/.fonts ya existe. Eliminándola..."
    rm -rf "$HOME/.fonts"
fi

echo "instalar fuentes"
mkdir $HOME/.fonts

cd $HOME/.fonts 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.tar.xz

echo "Descomprimiendo las fuentes"
tar xvf JetBrainsMono.tar.xz
tar xvf NerdFontsSymbolsOnly.tar.xz

echo "---------------------------"
echo "+ se instalaron correctamente +"
echo "---------------------------"
