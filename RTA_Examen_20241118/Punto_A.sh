#!/bin/bash

echo "Ejecutando Punto_A.sh"

# Crear particiones en /dev/sdc (2GB)
sudo fdisk /dev/sdc <<EOF
n
p
1

+5M
t
8E
n
p
2

+1.5G
t
2
8E
w
EOF

# Crear partición en /dev/sdd (1GB)
sudo fdisk /dev/sdd <<EOF
n
p
1

+512M
t
82
w
EOF

# Configurar y activar swap
sudo mkswap /dev/sdd1
sudo swapon /dev/sdd1

# Limpiar cualquier sistema de archivos previo
sudo wipefs -a /dev/sdc1 /dev/sdc2

# Crear volúmenes físicos y grupos de volúmenes
sudo pvcreate /dev/sdc1 /dev/sdc2
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2
sudo vgcreate vg_temp /dev/sdd1

# Crear volúmenes lógicos
sudo lvcreate -L 5M -n lv_docker vg_datos
sudo lvcreate -L 1.5G -n lv_workareas vg_datos
sudo lvcreate -L 512M -n lv_swap vg_temp

# Crear sistemas de archivos y activar swap
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo swapon /dev/mapper/vg_temp-lv_swap

# Crear puntos de montaje y montar volúmenes
sudo mkdir -p /var/lib/docker
sudo mkdir -p /work
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker
sudo mount /dev/mapper/vg_datos-lv_workareas /work

echo "Fin del script"

