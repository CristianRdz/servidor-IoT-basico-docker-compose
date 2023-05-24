echo "Deseas mantener los datos de la instalacion anterior? (y/n)"
read keep
if [ $keep = "n" ]; then
    rm -rf ~/DockerVolumes
fi
#Buscamos y borramos los contenedores de nodered mosquito y mysql
docker rm -f $(docker ps -a -q)
#Creamos los volumenes de nodered mosquito y mysql
mkdir -p ~/DockerVolumes/Mosquitto/config
mkdir -p ~/DockerVolumes/MySQL/config
mkdir -p ~/DockerVolumes/MySQL/data
mkdir -p ~/DockerVolumes/NodeRED/config
mkdir -p ~/DockerVolumes/NodeRED/data
cp my.cnf ~/DockerVolumes/MySQL/config
cp mosquitto.conf ~/DockerVolumes/Mosquitto/config
cp settings.js ~/DockerVolumes/NodeRED/config
docker compose up -d