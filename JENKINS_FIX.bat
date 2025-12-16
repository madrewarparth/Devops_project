@echo off
echo ========================================
echo    JENKINS PIPELINE FIX
echo ========================================
echo.
echo ❌ Problem: GitHub authentication failed
echo ✅ Solution: Use local Jenkinsfile
echo.
echo 🔧 STEPS TO FIX:
echo.
echo 1. Go to Jenkins: http://localhost:8081
echo 2. Open your pipeline job: finance-dashboard-pipeline
echo 3. Click "Configure"
echo 4. Change Pipeline Definition to: "Pipeline script"
echo 5. Copy content from: Jenkinsfile-simple
echo 6. Paste in Script box
echo 7. Click Save
echo 8. Click Build Now
echo.
echo 📁 Files ready:
echo - Jenkinsfile-simple (working version)
echo - Original Jenkinsfile (fixed URLs)
echo.
echo Opening Jenkins...
pause
start http://localhost:8081