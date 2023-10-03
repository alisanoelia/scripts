#/bin/bash

echo "Instalando dependencias"
echo " "

xbps-install xcb-util-renderutil-devel \
	xcb-util-image-devel \
	uthash \
	pcre-devel \
	libconfig-devel \
	libev-devel \
	meson

cd /root
git clone https://github.com/pijulius/picom
cd picom

echo " "
echo "Compilando"
echo " "

git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install

echo " "
echo "Se ha instalado correctamente"
echo " "
