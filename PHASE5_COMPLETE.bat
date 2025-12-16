@echo off
echo ========================================
echo    PHASE 5 - JENKINS COMPLETE!
echo ========================================
echo.
echo ✅ Jenkins installed and running
echo ✅ Container ID: ea1400d66e16
echo ✅ Jenkins URL: http://localhost:8081
echo ✅ Admin Password: 95c28dfceeb84457b83793eba4e7bec3
echo ✅ Jenkinsfile updated for Windows
echo.
echo 📋 MANUAL STEPS NEEDED:
echo.
echo 1. Open Jenkins: http://localhost:8081
echo 2. Login with password: 95c28dfceeb84457b83793eba4e7bec3
echo 3. Install suggested plugins
echo 4. Create admin user
echo 5. Install additional plugins:
echo    - Docker Pipeline
echo    - GitHub Integration  
echo    - Credentials Binding
echo.
echo 6. Add DockerHub credentials:
echo    - Go to: Manage Jenkins → Credentials
echo    - Add Username/Password
echo    - ID: dockerhub-credentials
echo    - Enter your DockerHub username/password
echo.
echo 7. Create Pipeline Job:
echo    - New Item → Pipeline
echo    - Name: finance-dashboard-pipeline
echo    - Pipeline from SCM → Git
echo    - Repository URL: your GitHub repo
echo    - Branch: */main
echo    - Script Path: Jenkinsfile
echo.
echo 🚀 Ready for Phase 6 - CI/CD Testing!
echo.
pause
start http://localhost:8081