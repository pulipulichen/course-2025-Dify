@echo off
setlocal

REM 取得目前 bat 檔所在的資料夾
set "base_dir=%~dp0"
cd /d "%base_dir%"

REM 執行 stop.sh（需要有 WSL 或 Git Bash 支援，否則這行會失敗）
call stop.bat

REM 刪除 dify/docker/volumes 資料夾
rmdir /s /q "dify\docker\volumes\app\storage"
rmdir /s /q "dify\docker\volumes\db\data"

endlocal
