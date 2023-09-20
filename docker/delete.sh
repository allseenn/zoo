#!/bin/bash
# Скрипт удаления последней установленной службы, docker swarm и последий созданый образ из системы
docker service rm $(docker service ls | tail -1 | awk '{ print $2 }')
docker swarm leave --force 
docker rmi $(docker images | head -2 | tail -1 | awk '{ print $3 }') --force 
rm -rf ~/mysql

