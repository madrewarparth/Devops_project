@echo off
echo ========================================
echo    JENKINS SETUP COMPLETE!
echo ========================================
echo.
echo Jenkins is running at: http://localhost:8081
echo.
echo Initial Admin Password: 95c28dfceeb84457b83793eba4e7bec3
echo.
echo Next Steps:
echo 1. Open http://localhost:8081 in browser
echo 2. Enter password: 95c28dfceeb84457b83793eba4e7bec3
echo 3. Install suggested plugins
echo 4. Create admin user
echo.
echo Jenkins Container Commands:
echo - Stop Jenkins: docker stop jenkins
echo - Start Jenkins: docker start jenkins
echo - View logs: docker logs jenkins
echo.
pause
start http://localhost:8081