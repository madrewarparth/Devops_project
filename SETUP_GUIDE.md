# 🚀 Complete DevOps Setup Guide

## 📂 PHASE 1 — Application Ready ✅
Your Personal Finance Dashboard is ready!

---

## 📂 PHASE 2 — Git & GitHub

### Step 1: Initialize Git
```bash
cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"
git init
git add .
git commit -m "Initial commit: Personal Finance Dashboard"
```

### Step 2: Create GitHub Repository
1. Go to https://github.com
2. Click "New Repository"
3. Name: `finance-dashboard`
4. Keep it Public
5. Don't initialize with README
6. Click "Create Repository"

### Step 3: Push to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/finance-dashboard.git
git branch -M main
git push -u origin main
```

---

## 🐳 PHASE 3 — Docker

### Step 1: Install Docker Desktop
- Download: https://www.docker.com/products/docker-desktop
- Install and restart PC
- Open Docker Desktop

### Step 2: Build Docker Image
```bash
cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"
docker build -t finance-dashboard .
```

### Step 3: Run Container
```bash
docker run -d -p 8080:80 --name finance-app finance-dashboard
```

### Step 4: Test
Open browser: http://localhost:8080

### Useful Docker Commands
```bash
# See running containers
docker ps

# Stop container
docker stop finance-app

# Remove container
docker rm finance-app

# See images
docker images

# Remove image
docker rmi finance-dashboard

# View logs
docker logs finance-app
```

---

## 🌐 PHASE 4 — DockerHub

### Step 1: Create Account
- Go to https://hub.docker.com
- Sign up (free)
- Remember your username

### Step 2: Login
```bash
docker login
# Enter username and password
```

### Step 3: Tag Image
```bash
docker tag finance-dashboard YOUR_DOCKERHUB_USERNAME/finance-dashboard:latest
```

### Step 4: Push to DockerHub
```bash
docker push YOUR_DOCKERHUB_USERNAME/finance-dashboard:latest
```

### Step 5: Verify
- Go to https://hub.docker.com
- Check your repositories
- Your image should be there!

---

## 🔧 PHASE 5 — Jenkins Setup

### Step 1: Install Jenkins (Using Docker)
```bash
docker run -d -p 8081:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
```

### Step 2: Initial Setup
1. Open: http://localhost:8081
2. Get initial password:
```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
3. Install suggested plugins
4. Create admin user

### Step 3: Install Required Plugins
1. Go to: Manage Jenkins → Plugins
2. Install:
   - Docker Pipeline
   - GitHub Integration
   - Credentials Binding

### Step 4: Add DockerHub Credentials
1. Manage Jenkins → Credentials
2. Add Credentials:
   - Kind: Username with password
   - ID: `dockerhub-credentials`
   - Username: Your DockerHub username
   - Password: Your DockerHub password

### Step 5: Create Pipeline Job
1. New Item → Pipeline
2. Name: `finance-dashboard-pipeline`
3. Pipeline Definition: Pipeline script from SCM
4. SCM: Git
5. Repository URL: Your GitHub repo URL
6. Branch: `*/main`
7. Script Path: `Jenkinsfile`
8. Save

### Step 6: Update Jenkinsfile
Edit `Jenkinsfile` and replace:
- `YOUR_DOCKERHUB_USERNAME` with your DockerHub username
- `YOUR_USERNAME` with your GitHub username

### Step 7: Run Pipeline
1. Click "Build Now"
2. Watch the pipeline execute
3. Check console output

---

## 🎯 PHASE 6 — Testing CI/CD

### Test 1: Change Color
1. Edit `styles.css` - change a gradient color
2. Commit and push:
```bash
git add .
git commit -m "Updated UI colors"
git push origin main
```
3. Watch Jenkins auto-build
4. Refresh http://localhost:8080

### Test 2: Add Feature
1. Edit `script.js` - add console.log
2. Commit and push
3. Jenkins rebuilds automatically
4. Check browser console

---

## 🐛 Troubleshooting

### Docker not starting?
```bash
# Restart Docker Desktop from system tray
```

### Port already in use?
```bash
# Find process
netstat -ano | findstr :8080

# Kill process (replace PID)
taskkill /PID <PID> /F
```

### Jenkins can't access Docker?
- Ensure Docker Desktop is running
- Restart Jenkins container

### Pipeline failing?
- Check Jenkins console output
- Verify DockerHub credentials
- Ensure Jenkinsfile has correct usernames
- Check Docker is running

---

## 📊 Project Checklist

- [ ] Application working locally
- [ ] Git initialized
- [ ] Code pushed to GitHub
- [ ] Docker Desktop installed
- [ ] Docker image builds successfully
- [ ] Container runs on port 8080
- [ ] DockerHub account created
- [ ] Image pushed to DockerHub
- [ ] Jenkins installed and running
- [ ] Jenkins plugins installed
- [ ] DockerHub credentials added
- [ ] Pipeline job created
- [ ] Jenkinsfile updated with usernames
- [ ] First successful pipeline build
- [ ] Auto-deployment tested
- [ ] Full CI/CD workflow verified

---

## 🎉 Success!

You now have:
✅ Personal Finance Dashboard
✅ Version Control (Git/GitHub)
✅ Containerization (Docker)
✅ Container Registry (DockerHub)
✅ CI/CD Pipeline (Jenkins)
✅ Automated Deployment

**Production-ready DevOps project complete!** 🚀
