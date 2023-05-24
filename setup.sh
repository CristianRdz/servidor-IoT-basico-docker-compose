echo "Deseas mantener los datos de la instalacion anterior? (y/n)"
read keep
if [ $keep = "n" ]; then
    rm -rf ~/DockerVolumes
fi
#Buscamos y borramos los contenedores de nodered mosquito y mysql
docker rm -f $(docker ps -a -q -f name=nodered)
docker rm -f $(docker ps -a -q -f name=mosquitto)
docker rm -f $(docker ps -a -q -f name=mysql)
#Buscamos y borramos las imagenes de nodered mosquito y mysql
docker rmi -f $(docker images -q -f reference=nodered)
docker rmi -f $(docker images -q -f reference=mosquitto)
docker rmi -f $(docker images -q -f reference=mysql)
#Buscamos y borramos los volumenes de nodered mosquito y mysql
docker volume rm $(docker volume ls -q -f name=nodered)
docker volume rm $(docker volume ls -q -f name=mosquitto)
docker volume rm $(docker volume ls -q -f name=mysql)
#Creamos los volumenes de nodered mosquito y mysql
mkdir -p ~/DockerVolumes/Mosquitto/config
mkdir -p ~/DockerVolumes/MySQL/config
mkdir -p ~/DockerVolumes/MySQL/data
mkdir -p ~/DockerVolumes/NodeRED/config
mkdir -p ~/DockerVolumes/NodeRED/data
mv my.cnf ~/DockerVolumes/MySQL/config
mv mosquitto.conf ~/DockerVolumes/Mosquitto/config
mv settings.js ~/DockerVolumes/NodeRED/config
docker-compose up -d