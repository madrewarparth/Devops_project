@echo off
echo ========================================
echo    DOCKERHUB IMAGE TEST
echo ========================================
echo.

set /p DOCKERHUB_USERNAME="Enter your DockerHub username: "

echo.
echo Step 1: Removing local image (to test pull)...
docker rmi %DOCKERHUB_USERNAME%/finance-dashboard:latest 2>nul

echo.
echo Step 2: Pulling from DockerHub...
docker pull %DOCKERHUB_USERNAME%/finance-dashboard:latest
if %errorlevel% neq 0 (
    echo ERROR: Failed to pull from DockerHub!
    pause
    exit /b 1
)

echo.
echo Step 3: Running container from DockerHub image...
docker run -d -p 8080:80 --name finance-app-test %DOCKERHUB_USERNAME%/finance-dashboard:latest
if %errorlevel% neq 0 (
    echo ERROR: Failed to run container!
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Container running from DockerHub!
echo ========================================
echo.
echo Open your browser and go to: http://localhost:8080
echo.
echo To stop the test container:
echo docker stop finance-app-test
echo docker rm finance-app-test
echo.
pause