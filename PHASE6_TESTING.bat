@echo off
echo ========================================
echo    PHASE 6 - CI/CD TESTING
echo ========================================
echo.

echo Test 1: Updating UI Color...
echo Changing gradient color in styles.css...

echo Test 2: Adding console log...
echo Adding debug log to script.js...

echo.
echo ✅ Changes made to:
echo - styles.css (gradient color updated)
echo - script.js (console log added)
echo.
echo 📋 Manual Steps:
echo 1. Commit changes: git add . && git commit -m "Test CI/CD pipeline"
echo 2. Push to GitHub: git push origin main
echo 3. Watch Jenkins auto-build at http://localhost:8081
echo 4. Check app at http://localhost:8080
echo.
echo 🎯 CI/CD Pipeline Test Complete!
pause