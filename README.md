# DOCKER-COMPOSE
From the [official sonarqube image](https://hub.docker.com/_/sonarqube/) (version 5.6), we will build an image with some preinstalled plugins.

(I'm using [Docker Toolbox](https://www.docker.com/products/docker-toolbox))

```
docker-machine env default
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env default)
docker-compose config
docker-compose up -d
docker-compose ps
       Name            Command      State                       Ports
------------------------------------------------------------------------------------------
synergie_sonarqube   ./bin/run.sh   Up      0.0.0.0:9000->9000/tcp, 0.0.0.0:9092->9092/tcp
```
