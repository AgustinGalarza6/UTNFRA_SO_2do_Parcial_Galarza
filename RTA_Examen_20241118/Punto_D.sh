# Editar el archivo main.yml
cd UTN-FRA_SO_Examenes/202406/ansible/roles/2do_parcial/tasks

vim main.yml

  - name: Crear el directorio /tmp/2do_parcial
    file:
      path: /tmp/2do_parcial
      state: directory
      mode: '0755'

  - name: Crear el directorio /tmp/2do_parcial/alumno
    file:
      path: /tmp/2do_parcial/alumno
      state: directory
      mode: '0755'

  - name: Crear el directorio /tmp/2do_parcial/equipo
    file:
      path: /tmp/2do_parcial/equipo
      state: directory
      mode: '0755'


# Crear el directorio "templates" y sus archivos .j2
cd UTN-FRA_SO_Examenes/202406/ansible/roles/2do_parcial/
mkdir templates
cd templates
touch datos_alumno.txt.j2
touch datos_pc.txt.j2

vim datos_alumno.txt.j2

Nombre: Pablo Agustin
Apellido: Galarza
Division: 311

:wq

vim datos_pc.txt.j2
IP: {{ ansible_default_ipv4.address }}  # Obtenido del ejemplo del repositorio de Ansible
Distribución: {{ansible_facts.distribution}}
Cantidad de Cores: {{ ansible_processor_cores }}

:wq

cd ..

# Crear el archivo datos_alumno.yml
touch datos_alumno.yml
vim datos_alumno.yml

- name: Generar archivo de datos del alumno
  hosts: localhost
  become: yes
  vars:
    nombre: "Pablo Agustin"       
    apellido: "Galarza"   
    division: "311"   
  
  tasks:
    - name: Crear el directorio para el archivo de datos
      file:
        path: /tmp/2do_parcial/alumno
        state: directory
        mode: '0755'

    - name: Generar el archivo de datos del alumno
      template:
        src: templates/datos_alumno.txt.j2  
        dest: /tmp/2do_parcial/alumno/datos_alumno.txt


# Crear el archivo datos_pc.yml
touch datos_pc.yml
vim datos_pc.yml

- name: Generar archivo de datos del equipo
  hosts: localhost
  become: yes
  gather_facts: yes  # Recolecta los hechos del sistema

  tasks:
    - name: Crear el directorio para el archivo de datos del equipo
      file:
        path: /tmp/2do_parcial/equipo
        state: directory
        mode: '0755'

    - name: Generar el archivo de datos del equipo
      template:
        src: templates/datos_pc.txt.j2
        dest: /tmp/2do_parcial/equipo/datos_equipo.txt


# Configurar sudoers
sudo groupadd 2PSupervisores
sudo visudo

# Agregar esta línea al archivo sudoers:
%2PSupervisores ALL=(ALL) NOPASSWD: ALL
