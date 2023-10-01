#!/bin/bash

git clone https://github.com/fastfetch-cli/fastfetch

cd fastfetch

mkdir -p build
cd build
cmake ..
cmake --build . --target fastfetch --target flashfetch

cp -rv fastfetch /usr/bin

echo " "
echo "Instalado correctamente"
