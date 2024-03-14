#!/bin/bash
echo -e "[+] Stopping containers"
docker ps | awk '{print $1}' | grep -v "CONTAINER" | xargs sudo docker stop
echo -e "[+] Deleting containers"
docker ps -a | awk '{print $1}' | grep -v "CONTAINER" | xargs sudo docker rm
echo -e "[+] Deleting images"
docker images | awk '{print $3}' | grep -vE "IMAGE|ID" | xargs sudo docker rmi
