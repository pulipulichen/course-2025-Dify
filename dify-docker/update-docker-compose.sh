#!/bin/bash

full_path=$(realpath "$0")
base_dir=$(dirname "$full_path")
cd "$base_dir"

# ====================

URL=https://raw.githubusercontent.com/langgenius/dify/refs/heads/main/docker/docker-compose.yaml

curl -o docker-compose.yaml $URL

# Add the prompts.py volume mount to docker-compose.yaml
sed -i '/- \.\/volumes\/app\/storage:\/app\/api\/storage/a\      - \.\/prompts\.py:\/app\/api\/core\/llm_generator\/prompts\.py' docker-compose.yaml

echo "Successfully updated docker-compose.yaml with prompts.py volume mount."
