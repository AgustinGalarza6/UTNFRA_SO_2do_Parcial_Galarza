#!/bin/bash

echo "Ejecutando Punto_B.sh"

# Parámetros
USER_ORIGEN_CLAVE="$1"
LISTA_USUARIOS="$2"

# Obtener la clave del usuario de origen
CLAVE_ORIGEN=$(sudo grep "^$USER_ORIGEN_CLAVE:" /etc/shadow | awk -F':' '{print $2}')

# Leer los usuarios y grupos del archivo
usuario1=$(head -n 1 "$LISTA_USUARIOS")
usuario2=$(head -n 2 "$LISTA_USUARIOS" | tail -n 1)

# Dividir el primer usuario y grupo
nombre_usuario1=$(echo "$usuario1" | awk -F':' '{print $1}')
grupo1=$(echo "$usuario1" | awk -F':' '{print $2}')
sudo groupadd "$grupo1"
sudo useradd -m -g "$grupo1" -p "$CLAVE_ORIGEN" "$nombre_usuario1"

# Dividir el segundo usuario y grupo
nombre_usuario2=$(echo "$usuario2" | awk -F':' '{print $1}')
grupo2=$(echo "$usuario2" | awk -F':' '{print $2}')
sudo groupadd "$grupo2"
sudo useradd -m -g "$grupo2" -p "$CLAVE_ORIGEN" "$nombre_usuario2"

echo "Fin del script"

