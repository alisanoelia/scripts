#!/bin/bash

xbps-install Vulkan-Headers

cd

git clone https://github.com/fastfetch-cli/fastfetch

cd fastfetch

mkdir -p build
cd build
cmake ..
cmake --build . --target fastfetch --target flashfetch

cp -rv fastfetch /usr/bin
cd

echo "Eliminando archivos que ya no se necesitan"
rm -rv fastfetch

echo " "
echo "Instalado correctamente"
