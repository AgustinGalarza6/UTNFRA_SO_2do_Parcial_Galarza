#!/bin/bash

echo "Ejecutando Punto_C.sh"

# Crear inventario de hosts
echo "[all]" > inventory
echo "localhost ansible_connection=local" >> inventory

# Crear estructura del role
mkdir -p roles/punto_d/{tasks,templates}

# Crear tareas en tasks/main.yml
cat <<EOF > roles/punto_d/tasks/main.yml
---
- name: Crear directorios necesarios
  file:
    path: "/tmp/2do_parcial/{{ item }}"
    state: directory
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"
    mode: '0755'
  loop:
    - alumno
    - equipo

- name: Generar datos_alumno.txt
  template:
    src: datos_alumno.j2
    dest: /tmp/2do_parcial/alumno/datos_alumno.txt

- name: Generar datos_equipo.txt
  template:
    src: datos_equipo.j2
    dest: /tmp/2do_parcial/equipo/datos_equipo.txt

- name: Configurar sudoers para 2PSupervisores
  lineinfile:
    path: /etc/sudoers
    state: present
    line: '%2PSupervisores ALL=(ALL) NOPASSWD: ALL'
    validate: 'visudo -cf %s'
EOF

# Crear templates para datos_alumno.txt
cat <<EOF > roles/punto_d/templates/datos_alumno.j2
- Nombre: Pablo Agustin
- Apellido: Galarza
- Division: 311
EOF

# Crear templates para datos_equipo.txt
cat <<EOF > roles/punto_d/templates/datos_equipo.j2
- IP: {{ ansible_default_ipv4.address }}
- Distribucion: {{ ansible_distribution }}
- Cantidad de cores: {{ ansible_processor_cores }}
EOF

# Crear playbook para ejecutar el role
cat <<EOF > playbook.yml
---
- name: Configuración del Punto D
  hosts: all
  become: true
  roles:
    - punto_d
EOF

# Ejecutar el playbook
ansible-playbook -i inventory playbook.yml

echo "Fin del script"

