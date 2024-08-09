#!/bin/bash

if [ -d "/root/ytfzf" ]; then
	echo "se eliminara la carpeta"
	rm -rv "/root/ytfzf"
fi

echo " "
echo "Descargando..."

xbps-install mpv \
	jq \
	fzf \
	curl

cd /root/
git clone --depth=1 https://github.com/pystardust/ytfzf
cd ytfzf
make install doc

echo "------------------------"
echo "Se instalo correctamente"
echo "------------------------"
