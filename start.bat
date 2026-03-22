@echo off
REM Check Docker requirements
docker --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Docker is not installed.
    EXIT /B 1
)

REM Check if Docker is running
docker info >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Docker is not running.
    EXIT /B 1
)

REM Start Mautic containers
docker-compose up -d
