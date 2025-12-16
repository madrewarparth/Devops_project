@echo off
echo ========================================
echo    JENKINS QUICK SETUP GUIDE
echo ========================================
echo.
echo 🔧 STEP 1: Open Jenkins
echo URL: http://localhost:8081
echo Password: 95c28dfceeb84457b83793eba4e7bec3
echo.
echo 🔧 STEP 2: Initial Setup
echo - Enter password above
echo - Install suggested plugins
echo - Create admin user (admin/admin123)
echo.
echo 🔧 STEP 3: Install Plugins
echo Go to: Manage Jenkins → Plugins → Available
echo Install: Docker Pipeline, GitHub Integration, Credentials Binding
echo.
echo 🔧 STEP 4: Add DockerHub Credentials
echo Go to: Manage Jenkins → Credentials → Add
echo - Kind: Username with password
echo - ID: dockerhub-credentials
echo - Username: your_dockerhub_username
echo - Password: your_dockerhub_password
echo.
echo 🔧 STEP 5: Create Pipeline
echo - New Item → Pipeline
echo - Name: finance-dashboard-pipeline
echo - Pipeline from SCM → Git
echo - Repo: your_github_repo_url
echo - Branch: */main
echo - Script Path: Jenkinsfile
echo.
echo 🔧 STEP 6: Test
echo - Click Build Now
echo - Check Console Output
echo.
echo Opening Jenkins now...
pause
start http://localhost:8081