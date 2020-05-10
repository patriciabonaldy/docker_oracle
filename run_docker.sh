#!/bin/bash


export DOCKER_ID=$(docker container ls | grep bd_meli | awk '{print $1}')

mount_BD(){
docker run -it -d -p 1521:1521  --name=meli bd_meli 
#Crea el usuario meli y sus tablas
docker exec  $DOCKER_ID  /bin/bash  ./create_schema.sh  mount_BD
}

down_services(){
docker exec  $DOCKER_ID  /bin/bash  ./create_schema.sh  down_BD   
}

start_services(){
docker exec  $DOCKER_ID  /bin/bash  ./create_schema.sh  start_BD    
}


case "$1" in
##########################################################################
## baja la BD (se aplica si se realizo cambio a nivel de performance)   ##
##########################################################################
    down_BD)
        down_services
        ;;
    start_BD)
        start_services
        ;;
    mount_BD)
        mount_BD
        ;;
    *)
        echo "Usage: $0 {down_BD|start_BD|mount_BD}"
esac