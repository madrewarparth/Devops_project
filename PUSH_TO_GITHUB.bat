@echo off
echo ========================================
echo  Pushing to GitHub
echo ========================================
echo.

cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"

echo Step 1: Git Initialize...
git init

echo.
echo Step 2: Adding all files...
git add .

echo.
echo Step 3: Creating commit...
git commit -m "Initial commit: Personal Finance Dashboard with DevOps"

echo.
echo Step 4: Adding remote repository...
git remote add origin https://github.com/madrewarparth/devops-project.git

echo.
echo Step 5: Setting branch to main...
git branch -M main

echo.
echo Step 6: Pushing to GitHub...
git push -u origin main

echo.
echo ========================================
echo  Done! Check GitHub repository
echo ========================================
pause
