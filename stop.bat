@echo off
setlocal enabledelayedexpansion

:: Get the script directory
set "full_path=%~f0"
set "base_dir=%~dp0"
cd /d "%base_dir%"

:: ========================

:: Remove Docker volumes (uncomment if needed)
:: rmdir /s /q .\dify\docker\volumes

:: Docker Compose down with multiple env files and compose files
docker-compose^
  --env-file ./dify/docker/.env.example^
  --env-file ./default.env^
  --env-file .env^
  -f ./dify/docker/docker-compose.yaml^
  -f ./cloudflare-dify/docker-compose.yml^
  down

:: Uncomment the following line to include volume removal:
:: docker-compose down -v

endlocal
