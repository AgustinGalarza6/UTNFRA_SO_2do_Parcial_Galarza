#!/bin/bash

echo "Ejecutando Punto_C.sh"

# Definir variables
REPO_PATH="/UTN-FRA_SO_Examenes/202406/docker"
DOCKER_IMAGE_NAME="web1-Galarza"
DOCKER_HUB_USERNAME="19801975"  # Tu nombre de usuario de Docker Hub

# Crear el archivo index.html con el mensaje de bienvenida
echo "<h1>Bienvenidos a la página de Pablo Agustin Galarza</h1>" > "$REPO_PATH/index.html"

# Crear el Dockerfile
echo -e "FROM nginx\nCOPY index.html /usr/share/nginx/html/index.html" > "$REPO_PATH/Dockerfile"

# Construir la imagen de Docker
docker build -t "$DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME" "$REPO_PATH"

# Iniciar sesión en Docker Hub (pedirás la contraseña cuando se ejecute)
docker login -u "$DOCKER_HUB_USERNAME" -p "<docker-password>"

# Subir la imagen a Docker Hub
docker push "$DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME"

# Crear el script run.sh para ejecutar el contenedor
echo "#!/bin/bash" > "$REPO_PATH/run.sh"
echo "docker run -d -p 8080:80 $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME" >> "$REPO_PATH/run.sh"

# Dar permisos de ejecución al script run.sh
chmod +x "$REPO_PATH/run.sh"

echo "Fin del script"

