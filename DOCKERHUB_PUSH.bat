@echo off
echo ========================================
echo    DOCKERHUB PUSH AUTOMATION
echo ========================================
echo.

echo Step 1: Docker Login
echo Please enter your DockerHub credentials when prompted...
docker login
if %errorlevel% neq 0 (
    echo ERROR: Docker login failed!
    pause
    exit /b 1
)

echo.
echo Step 2: Enter your DockerHub username
set /p DOCKERHUB_USERNAME="Enter your DockerHub username: "

echo.
echo Step 3: Tagging image...
docker tag finance-dashboard %DOCKERHUB_USERNAME%/finance-dashboard:latest
if %errorlevel% neq 0 (
    echo ERROR: Failed to tag image!
    pause
    exit /b 1
)

echo.
echo Step 4: Pushing to DockerHub...
docker push %DOCKERHUB_USERNAME%/finance-dashboard:latest
if %errorlevel% neq 0 (
    echo ERROR: Failed to push to DockerHub!
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Image pushed to DockerHub!
echo ========================================
echo.
echo Your image is now available at:
echo https://hub.docker.com/r/%DOCKERHUB_USERNAME%/finance-dashboard
echo.
echo You can pull it anywhere using:
echo docker pull %DOCKERHUB_USERNAME%/finance-dashboard:latest
echo.
pause