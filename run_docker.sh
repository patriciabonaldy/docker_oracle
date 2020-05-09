#!/bin/bash

docker run -it -d -p 1521:1521  --name=meli bd_meli 

export DOCKER_ID=$(docker container ls | grep bd_meli | awk '{print $1}')

#docker exec -it $DOCKER_ID  /bin/bash  ./post_install.sh 
docker exec -it $DOCKER_ID  /bin/bash  ./create_schema.sh