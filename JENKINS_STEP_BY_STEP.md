# 🔧 Jenkins Setup - Step by Step

## Step 1: Open Jenkins
- Go to: **http://localhost:8081**
- Password: **95c28dfceeb84457b83793eba4e7bec3**

## Step 2: Initial Setup
1. Enter password: `95c28dfceeb84457b83793eba4e7bec3`
2. Click "Install suggested plugins" 
3. Wait for plugins to install (2-3 minutes)
4. Create admin user:
   - Username: `admin`
   - Password: `admin123`
   - Full name: `Admin User`
   - Email: `admin@example.com`
5. Click "Save and Continue"
6. Keep default Jenkins URL
7. Click "Save and Finish"

## Step 3: Install Required Plugins
1. Go to: **Manage Jenkins** → **Plugins**
2. Click **Available plugins**
3. Search and install:
   - `Docker Pipeline`
   - `GitHub Integration`
   - `Credentials Binding`
4. Click "Install" and restart Jenkins

## Step 4: Add DockerHub Credentials
1. Go to: **Manage Jenkins** → **Credentials**
2. Click **System** → **Global credentials**
3. Click **Add Credentials**
4. Select:
   - Kind: `Username with password`
   - Username: `demouser` (your DockerHub username)
   - Password: `your_dockerhub_password`
   - ID: `dockerhub-credentials`
5. Click **Create**

## Step 5: Create Pipeline Job
1. Click **New Item**
2. Enter name: `finance-dashboard-pipeline`
3. Select **Pipeline**
4. Click **OK**
5. In configuration:
   - Pipeline Definition: `Pipeline script from SCM`
   - SCM: `Git`
   - Repository URL: `https://github.com/demouser/finance-dashboard.git`
   - Branch: `*/main`
   - Script Path: `Jenkinsfile`
6. Click **Save**

## Step 6: Test Pipeline
1. Click **Build Now**
2. Watch build in **Build History**
3. Click build number → **Console Output**
4. Check for success ✅

## 🎯 Done!
Your Jenkins CI/CD pipeline is ready!