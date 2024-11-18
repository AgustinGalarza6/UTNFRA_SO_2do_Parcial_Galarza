# Editando el html con los datos requeridos

vim index.html 

<div>
<h1> Arquitectura y Sistemas Operativos - UTNFRA </h1></br>
<h2> 2do Parcial - Junio del 2024 </h2> </br>
<h3> Galarza Pablo Agustin</h3>
<h3> División:311 TN</h3>
</div>

:wq


# Crear el Dockerfile
echo -e "FROM nginx\nCOPY index.html /usr/share/nginx/html/index.html" > "$REPO_PATH/Dockerfile"


# Log en Docker

docker login -u 19801975 
#Token de acceso

# Construir imagen y pushearla

docker build -t web1-GalarzaPablo:latest .
docker image list
docker tag web1-GalarzaPablo:latest 19801975/web1-GalarzaPablo:latest
docker push 19801975/web1-GalarzaPablo


# Crear el archivo run.sh
touch run.sh

# Editar el archivo run.sh
vim run.sh

#!/bin/bash
docker run -d -p 8080:80 19801975/web1-GalarzaPablo:latest

:wq

# Damos permisos de ejecución al archivo run.sh
chmod +x run.sh
