#!/bin/bash

docker run -it -d -p 1521:1521  --name=meli bd_meli 

export DOCKER_ID=$(docker container ls | grep bd_meli | awk '{print $1}')

#Crea el usuario meli y sus tablas
docker exec  $DOCKER_ID  /bin/bash  ./create_schema.sh  mount_BD
##########################################################################
## baja la BD (se aplica si se realizo cambio a nivel de performance)   ##
# descomentar para que tome los cambios                                 ##
#########################################################################
#docker exec  $DOCKER_ID  /bin/bash  ./create_schema.sh  down_BD
#docker exec  $DOCKER_ID  /bin/bash  ./create_schema.sh  start_BD