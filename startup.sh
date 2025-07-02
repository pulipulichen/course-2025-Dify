#!/bin/bash

full_path=$(realpath "$0")
base_dir=$(dirname "$full_path")
cd "$base_dir"

touch .env

# ========================

#sudo rm -rf ./dify/docker/volumes

./stop.sh

# 判斷是否需要 sudo (Determine if sudo is needed)
SUDO_CMD=""
# 如果當前用戶不是 root 且不在 docker 群組中，則需要 sudo (If current user is not root and not in docker group, then sudo is needed)
if [ "$(id -u)" -ne 0 ] && ! groups | grep -q docker; then
    SUDO_CMD="sudo"
fi

# 判斷要使用 docker-compose 還是 docker compose (Determine whether to use docker-compose or docker compose)
if command -v docker-compose &> /dev/null; then
    DOCKER_CMD="docker-compose"
else
    DOCKER_CMD="docker compose"
fi

$SUDO_CMD $DOCKER_CMD \
  --env-file ./dify-docker/.env.example \
  --env-file ./default.env \
  --env-file .env \
  -f ./dify-docker/docker-compose.yaml \
  -f ./cloudflare-dify/docker-compose.yml up --build
