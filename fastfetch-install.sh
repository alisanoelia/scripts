#!/bin/bash

echo " "
echo "Instalando dependencias!"
xbps-install Vulkan-Headers \
	cmake

cd /root

git clone https://github.com/fastfetch-cli/fastfetch

cd fastfetch

mkdir -p build
cd build
cmake ..
cmake --build . --target fastfetch

cp -rv fastfetch /usr/bin
cd /root

echo "Eliminando archivos que ya no se necesitan"
rm -rv fastfetch

echo " "
echo "Instalado correctamente"
