#!/bin/bash

echo "Comprobando si ya tienes ueberzugpp"
if [ -d "/root/ueberzugpp" ]; then
	echo "Ya existe. Eliminando"
	rm -rf "/root/ueberzugpp"
fi

echo "Vas a instalar ueberzugpp"
echo " "
echo "Descargando dependencias"
sudo xbps-install cmake \
	libvips-devel \
	libsixel-devel \
	chafa-devel \
	openssl-devel \
	tbb-devel \
	xcb-util-image-devel

cd /root
git clone https://github.com/jstkdng/ueberzugpp

echo "Vamos bien..."
sleep 0.5s 

cd ueberzugpp
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_OPENCV=OFF ..
cmake --build .

cp -rv ueberzug /usr/bin/

echo " "
echo "------------------------"
echo "Se instalo correctamente"
