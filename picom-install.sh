#/bin/bash

printf "Instalando dependencias\n"
printf "\n"

xbps-install xcb-util-renderutil-devel \
	xcb-util-image-devel \
	uthash \
	pcre-devel \
	libconfig-devel \
	libev-devel \
	meson

cd /root
git clone --depth 1 https://github.com/fdev31/picom
cd picom

printf "\n"
printf "Compilando\n"
printf "\n"

git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install

printf "\n"
printf "Se ha instalado correctamente\n"
printf "\n"
