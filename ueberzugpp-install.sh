#!/bin/bash

printf "Comprobando si ya tienes ueberzugpp \n"

if [ -d "/root/ueberzugpp" ]; then
	printf "Ya existe. Eliminando \n"

	rm -rf "/root/ueberzugpp"
fi

printf "Vas a instalar ueberzugpp \n"

printf " \n"

printf "Descargando dependencias \n"

sudo xbps-install cmake \
	libvips-devel \
	libsixel-devel \
	chafa-devel \
	openssl-devel \
	tbb-devel \
	xcb-util-image-devel

cd /root
git clone --depth 1 https://github.com/jstkdng/ueberzugpp

printf "Vamos bien... \n"

sleep 0.5s 

cd ueberzugpp
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_OPENCV=OFF ..
cmake --build . -j$(nproc)

cp -rv ueberzug /usr/bin/
cp -rv ueberzug /usr/bin/ueberzugpp

printf " \n"
printf "Se instalo correctamente \n"
