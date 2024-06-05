#!/bin/sh -e

if [ -d "$HOME/.brave" ]; then
  sudo rm -rfv "$HOME/.brave"
  printf "Se eliminara la carpeta...\n"
fi

printf "Se instalara min-browser \n"
printf "Instalando dependencias... \n"
sleep 0.5
sudo xbps-install -y git wget xz curl

# Verificar si la carpeta ya existe
if [ -d "$HOME/.brave" ]; then
  echo "La carpeta ya existe. Se saltará la creación."
else
  # Crear la carpeta
  mkdir "$HOME/.brave"
  printf "La carpeta se ha creado correctamente.\n"
fi

cd "$HOME/.brave" || exit
printf "Listo"
printf "Clonando xdeb \n"

git clone https://github.com/toluschr/xdeb
printf "Vamos bien \n"
cd xdeb

printf "Descargando min-browser \n"
wget https://github.com/brave/brave-browser/releases/download/v1.66.120/brave-browser_1.66.120_amd64.deb

printf "Convirtiendo paquete \n"
./xdeb -Sde brave-browser_1.66.120_amd64.deb

printf "Instalando \n"
sudo xbps-install -R binpkgs brave-browser-1.66.120_1

sleep 0.5

printf "Configurando \n"

sleep 0.5
echo "--------------------------"
printf "Se instalo correctamente\n"
