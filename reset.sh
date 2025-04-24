#!/bin/bash

full_path=$(realpath "$0")
base_dir=$(dirname "$full_path")
cd "$base_dir"

./stop.sh

sudo rm -rf dify/docker/volumes