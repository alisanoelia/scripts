#!/bin/sh -e

VERSION="1.33.1"

if [ -d "$HOME/.min" ]; then
  sudo rm -rfv "$HOME/.min"
  printf "Se eliminará la carpeta...\n"
fi

printf "Se instalará min-browser \n"
printf "Instalando dependencias... \n"
sleep 0.5
sudo xbps-install -y git wget xz curl

if [ -d "$HOME/.min" ]; then
  printf "La carpeta ya existe. Se saltará la creación.\n"
else
  mkdir "$HOME/.min"
  printf "La carpeta se ha creado correctamente.\n"
fi

cd "$HOME/.min" || exit
printf "Listo"
printf "Clonando xdeb \n"

git clone https://github.com/toluschr/xdeb
printf "Vamos bien \n"
cd xdeb

printf "Descargando min-browser \n"
wget "https://github.com/minbrowser/min/releases/download/v${VERSION}/min-${VERSION}-amd64.deb"

printf "Convirtiendo paquete \n"
./xdeb -Sde "min-${VERSION}-amd64.deb"

printf "Instalando \n"
sudo xbps-install -R binpkgs "min-${VERSION}_1"

sleep 0.5

printf "Configurando \n"
printf "Creando enlace \n"
sudo ln -sf "$HOME/.min/xdeb/destdir/opt/Min/min" /usr/bin/min

sleep 0.5
printf "--------------------------\n"
printf "Se instaló correctamente\n"
