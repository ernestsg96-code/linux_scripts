#!/bin/bash

user=$(whoami)
directory=$(pwd)
uptime=$(uptime)
files=$(ls ~ | wc -l)


echo "Usuario: $user"
echo "Directorio: $directory"
echo "Uptime: $uptime"
echo "Ficheros: $files"
