#!/bin/bash

full_path=$(realpath "$0")
base_dir=$(dirname "$full_path")
cd "$base_dir"

touch .env

# ========================

#sudo rm -rf ./dify/docker/volumes

./stop.sh

# 判斷要使用 docker-compose 還是 docker compose
if command -v docker-compose &> /dev/null; then
    DOCKER_CMD="docker-compose"
else
    DOCKER_CMD="docker compose"
fi

$DOCKER_CMD \
  --env-file ./dify-docker/.env.example \
  --env-file ./default.env \
  --env-file .env \
  -f ./dify-docker/docker-compose.yaml \
  -f ./cloudflare-dify/docker-compose.yml up --build
