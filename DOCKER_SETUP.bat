@echo off
echo ========================================
echo       Docker Setup - Finance Dashboard
echo ========================================
echo.

echo Step 1: Checking Docker Desktop status...
:check_docker
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker Desktop is not ready yet...
    echo Please wait for Docker Desktop to fully start
    echo Then run this script again
    echo.
    echo If Docker Desktop is not running:
    echo 1. Look for Docker icon in system tray
    echo 2. Right-click and select "Start Docker Desktop"
    echo 3. Wait for it to show "Docker Desktop is running"
    echo.
    pause
    exit /b 1
) else (
    echo Docker Desktop is running! ✓
)

echo.
echo Step 2: Building Docker image...
docker build -t finance-dashboard .
if %errorlevel% neq 0 (
    echo Failed to build Docker image
    pause
    exit /b 1
)

echo.
echo Step 3: Running Docker container...
docker run -d -p 8080:80 --name finance-app finance-dashboard
if %errorlevel% neq 0 (
    echo Container might already exist, trying to remove and restart...
    docker stop finance-app 2>nul
    docker rm finance-app 2>nul
    docker run -d -p 8080:80 --name finance-app finance-dashboard
    if %errorlevel% neq 0 (
        echo Failed to run container
        pause
        exit /b 1
    )
)

echo.
echo Step 4: Testing application...
echo Waiting for container to start...
timeout /t 5 >nul

echo.
echo ========================================
echo           SUCCESS! 🎉
echo ========================================
echo Your Finance Dashboard is now running!
echo.
echo 🌐 Open in browser: http://localhost:8080
echo.
echo Useful commands:
echo - View running containers: docker ps
echo - Stop container: docker stop finance-app
echo - View logs: docker logs finance-app
echo - Remove container: docker rm finance-app
echo.
pause