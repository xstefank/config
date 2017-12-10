#!/bin/bash

docker rmi $(docker images -a -q)

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker volume rm $(docker volume ls -f dangling=true -q)

echo finished...



