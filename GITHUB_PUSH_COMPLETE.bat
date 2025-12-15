@echo off
echo ========================================
echo    GitHub Push Setup - Complete Guide
echo ========================================
echo.

echo Step 1: Checking if Git is installed...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is NOT installed!
    echo.
    echo Please install Git first:
    echo 1. Go to: https://git-scm.com/download/win
    echo 2. Download and install Git for Windows
    echo 3. Restart this script after installation
    echo.
    pause
    exit /b 1
) else (
    echo Git is installed! ✓
)

echo.
echo Step 2: Initializing Git repository...
git init
if %errorlevel% neq 0 (
    echo Failed to initialize Git repository
    pause
    exit /b 1
)

echo.
echo Step 3: Adding all files...
git add .
if %errorlevel% neq 0 (
    echo Failed to add files
    pause
    exit /b 1
)

echo.
echo Step 4: Creating initial commit...
git commit -m "Initial commit: Personal Finance Dashboard DevOps Project"
if %errorlevel% neq 0 (
    echo Failed to create commit
    pause
    exit /b 1
)

echo.
echo Step 5: Adding remote repository...
git remote add origin https://github.com/madrewarparth/Devops_project.git
if %errorlevel% neq 0 (
    echo Failed to add remote repository
    pause
    exit /b 1
)

echo.
echo Step 6: Setting main branch...
git branch -M main
if %errorlevel% neq 0 (
    echo Failed to set main branch
    pause
    exit /b 1
)

echo.
echo Step 7: Pushing to GitHub...
echo Note: You may need to enter your GitHub credentials
git push -u origin main
if %errorlevel% neq 0 (
    echo Failed to push to GitHub
    echo.
    echo Common solutions:
    echo 1. Check your internet connection
    echo 2. Verify GitHub repository URL
    echo 3. Make sure you have push permissions
    echo 4. Try using Personal Access Token instead of password
    pause
    exit /b 1
)

echo.
echo ========================================
echo           SUCCESS! 🎉
echo ========================================
echo Your project has been pushed to GitHub!
echo Repository: https://github.com/madrewarparth/Devops_project.git
echo.
echo Next steps:
echo 1. Visit your GitHub repository
echo 2. Verify all files are uploaded
echo 3. Continue with Docker setup
echo.
pause