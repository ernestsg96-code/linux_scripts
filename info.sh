#!/bin/bash
echo "Usuario: $(whoami)"
echo "Directorio: $(pwd)"
echo "Uptime: $(uptime)"
echo "Ficheros: $(ls ~ | wc -l)"
