@echo off
color 0A
echo ========================================
echo   GitHub Push Script
echo ========================================
echo.
echo Instructions:
echo 1. Get your GitHub token from: https://github.com/settings/tokens
echo 2. Click "Generate new token (classic)"
echo 3. Select "repo" scope
echo 4. Copy the token
echo.
pause
echo.

cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"

echo [1/6] Initializing Git...
git init
if errorlevel 1 (
    echo ERROR: Git not found! Install Git first.
    pause
    exit
)

echo.
echo [2/6] Adding files...
git add .

echo.
echo [3/6] Creating commit...
git commit -m "Initial commit: Personal Finance Dashboard with DevOps"

echo.
echo [4/6] Adding remote...
git remote add origin https://github.com/madrewarparth/devops-project.git 2>nul
if errorlevel 1 (
    echo Remote already exists, updating...
    git remote set-url origin https://github.com/madrewarparth/devops-project.git
)

echo.
echo [5/6] Setting branch to main...
git branch -M main

echo.
echo [6/6] Pushing to GitHub...
echo.
echo Enter your GitHub credentials when prompted:
echo Username: madrewarparth
echo Password: [Your GitHub Token]
echo.
git push -u origin main

echo.
if errorlevel 1 (
    echo ========================================
    echo   FAILED! Check your credentials
    echo ========================================
    echo.
    echo Common issues:
    echo - Wrong token
    echo - Token expired
    echo - No internet connection
    echo.
    echo Get new token: https://github.com/settings/tokens
) else (
    echo ========================================
    echo   SUCCESS! Code pushed to GitHub
    echo ========================================
    echo.
    echo Check: https://github.com/madrewarparth/devops-project
)

echo.
pause
