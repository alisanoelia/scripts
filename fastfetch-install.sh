#!/bin/bash

printf "\n"
printf "Instalando dependencias!\n"
xbps-install Vulkan-Headers \
	cmake

cd /root

git clone --depth 1 https://github.com/fastfetch-cli/fastfetch

cd fastfetch

mkdir -p build
cd build
cmake ..
cmake --build . --target fastfetch

cp -rv fastfetch /usr/bin
cd /root

printf "Eliminando archivos que ya no se necesitan\n"
rm -rv fastfetch

printf "\n"
printf "Instalado correctamente\n"
