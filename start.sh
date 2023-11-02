#!/bin/bash

docker build -t mike-dev .
docker volume create mike-dev
docker stop mike-dev
docker rm mike-dev
docker run \
  -it \
  --name='mike-dev' \
  -v '/var/run/docker.sock':'/var/run/docker.sock':'rw' \
  -v mike-dev:/home/mike \
  mike-dev
docker exec -it mike-dev /bin/zsh