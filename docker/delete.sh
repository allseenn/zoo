#!/bin/bash
# Скрипт удаления последней установленной службы, docker swarm и последий созданый образ из системы
docker --force service rm $(docker service ls | tail -1 | awk '{ print $2 }')
docker --force swarm leave
docker --force rmi $(docker images | head -2 | tail -1 | awk '{ print $3 }')

