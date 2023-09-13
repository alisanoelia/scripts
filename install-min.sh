#!/bin/sh -e
#

if [ -d "$HOME/.min" ]; then
  sudo rm -rfv "$HOME/.min"
  printf "Se eliminara la carpeta...\n"
fi

printf "Se instalara min-browser \n"
printf "Instalando dependencias... \n"
sleep 0.5
sudo xbps-install -y git wget xz curl

# Verificar si la carpeta ya existe
if [ -d "$HOME/.min" ]; then
  echo "La carpeta ya existe. Se saltará la creación."
else
  # Crear la carpeta
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
wget https://github.com/minbrowser/min/releases/download/v1.29.0/min-1.29.0-amd64.deb

printf "Convirtiendo paquete \n"
./xdeb -Sde min-1.29.0-amd64.deb

printf "Instalando \n"
sudo xbps-install -R binpkgs min-1.29.0_1

sleep 0.5

printf "Configurando \n"
printf "Creando enlace \n"
sudo ln -sf /home/alyssa/.min/xdeb/destdir/opt/Min/min /usr/bin/min

sleep 0.5
echo "--------------------------"
printf "Se instalo correctamente\n"
