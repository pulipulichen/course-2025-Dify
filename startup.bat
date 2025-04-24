@echo off
setlocal enabledelayedexpansion

:: Get the script directory
set "full_path=%~f0"
set "base_dir=%~dp0"
cd /d "%base_dir%"

:: Create .env file if it doesn't exist
if not exist .env type nul > .env

:: ========================

:: Stop existing Docker services
call stop.bat

:: Run Docker Compose with multiple env files and compose files
docker-compose^
  --env-file ./dify/docker/.env.example^
  --env-file ./default.env^
  --env-file .env^
  -f ./dify/docker/docker-compose.yaml^
  -f ./cloudflare-dify/docker-compose.yml^
  up --build

:: Uncomment the following block if you want the alternative command:
:: docker-compose --env-file ./default.env --env-file .env -f ./dify2openai/docker-compose.yml up --build

endlocal
