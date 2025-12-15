# 🚀 Personal Finance Dashboard - Complete DevOps Guide (Hindi)

## 📋 Table of Contents
1. [Prerequisites (ज़रूरी चीज़ें)](#prerequisites)
2. [Phase 1: Application Test](#phase-1)
3. [Phase 2: Git & GitHub Setup](#phase-2)
4. [Phase 3: Docker Setup](#phase-3)
5. [Phase 4: DockerHub](#phase-4)
6. [Phase 5: Jenkins Setup](#phase-5)
7. [Phase 6: Complete CI/CD](#phase-6)
8. [Troubleshooting](#troubleshooting)

---

## Prerequisites (ज़रूरी चीज़ें) {#prerequisites}

### 1. Git Install करें
**Download:** https://git-scm.com/download/win

**Installation Steps:**
1. Download करें और installer चलाएं
2. सभी default options रखें
3. "Next" दबाते जाएं
4. Install complete होने पर "Finish" करें

**Verify करें:**
```bash
git --version
```

### 2. GitHub Account बनाएं
1. https://github.com पर जाएं
2. "Sign up" पर क्लिक करें
3. Email, password डालें
4. Account verify करें

### 3. Docker Desktop Install करें
**Download:** https://www.docker.com/products/docker-desktop

**Installation Steps:**
1. Download करें (लगभग 500MB)
2. Installer चलाएं
3. "Use WSL 2 instead of Hyper-V" option चेक करें
4. Install complete होने पर PC restart करें
5. Docker Desktop खोलें
6. Terms accept करें

**Verify करें:**
```bash
docker --version
docker ps
```

### 4. DockerHub Account बनाएं
1. https://hub.docker.com पर जाएं
2. "Sign up" करें
3. Username याद रखें (बाद में काम आएगा)

---

## Phase 1: Application Test {#phase-1}

### Step 1: Application चेक करें
```bash
cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"
```

### Step 2: Browser में खोलें
- `index.html` पर right-click करें
- "Open with" → Browser select करें
- Application test करें:
  - Transaction add करें
  - Budget set करें
  - Charts देखें

✅ **अगर सब काम कर रहा है तो आगे बढ़ें!**

---

## Phase 2: Git & GitHub Setup {#phase-2}

### Step 1: Git Initialize करें

**Command Prompt खोलें:**
- Windows Key + R दबाएं
- `cmd` टाइप करें
- Enter दबाएं

**Commands चलाएं:**
```bash
cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"
git init
git add .
git commit -m "Initial commit: Finance Dashboard"
```

**Output देखेंगे:**
```
Initialized empty Git repository...
[main (root-commit) abc1234] Initial commit: Finance Dashboard
 8 files changed, 500 insertions(+)
```

### Step 2: GitHub पर Repository बनाएं

1. **Browser में जाएं:** https://github.com
2. **Login करें** अपने account से
3. **New Repository बनाएं:**
   - ऊपर right में "+" icon → "New repository"
   - Repository name: `finance-dashboard`
   - Description: "Personal Finance Dashboard with DevOps"
   - Public select करें
   - **कुछ भी check न करें** (no README, no .gitignore)
   - "Create repository" क्लिक करें

### Step 3: Code Push करें

**GitHub पर आपको commands दिखेंगे, उन्हें copy करें या ये use करें:**

```bash
git remote add origin https://github.com/YOUR_USERNAME/finance-dashboard.git
git branch -M main
git push -u origin main
```

**⚠️ Important:** `YOUR_USERNAME` को अपने GitHub username से replace करें!

**Example:**
```bash
git remote add origin https://github.com/rahul123/finance-dashboard.git
git branch -M main
git push -u origin main
```

**पहली बार GitHub credentials मांगेगा:**
- Username: आपका GitHub username
- Password: GitHub Personal Access Token (नीचे देखें)

### GitHub Token बनाएं (अगर password काम नहीं करे)

1. GitHub → Settings (profile icon)
2. Developer settings (सबसे नीचे)
3. Personal access tokens → Tokens (classic)
4. Generate new token (classic)
5. Note: "Finance Dashboard"
6. Expiration: 90 days
7. Select scopes: `repo` (पूरा check करें)
8. Generate token
9. **Token copy करें** (फिर नहीं दिखेगा!)
10. Password की जगह ये token use करें

✅ **Verify:** GitHub पर अपनी repository खोलें, सारी files दिखनी चाहिए!

---

## Phase 3: Docker Setup {#phase-3}

### Step 1: Docker Desktop चालू करें
- Docker Desktop icon पर double-click करें
- Wait करें जब तक "Docker Desktop is running" दिखे
- System tray में whale icon green होना चाहिए

### Step 2: Dockerfile Check करें

**File खोलें:** `time-capsule/Dockerfile`

**Content होना चाहिए:**
```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Step 3: Docker Image Build करें

**Command Prompt में:**
```bash
cd "c:\Users\Admin\Desktop\Devops projectg\time-capsule"
docker build -t finance-dashboard .
```

**Output देखेंगे:**
```
[+] Building 15.2s (9/9) FINISHED
 => [internal] load build definition
 => => transferring dockerfile
 => [internal] load .dockerignore
 => [1/3] FROM docker.io/library/nginx:alpine
 => [2/3] COPY index.html /usr/share/nginx/html/
 => [3/3] COPY styles.css /usr/share/nginx/html/
 => exporting to image
 => => naming to docker.io/library/finance-dashboard
```

**⏱️ Time:** पहली बार 2-3 minutes लग सकते हैं

### Step 4: Image Check करें
```bash
docker images
```

**Output:**
```
REPOSITORY           TAG       IMAGE ID       CREATED         SIZE
finance-dashboard    latest    abc123def456   2 minutes ago   40MB
```

### Step 5: Container Run करें
```bash
docker run -d -p 8080:80 --name finance-app finance-dashboard
```

**Explanation:**
- `-d` = background में run करो
- `-p 8080:80` = port 8080 पर access करो
- `--name finance-app` = container का नाम
- `finance-dashboard` = image का नाम

### Step 6: Test करें

**Browser खोलें:** http://localhost:8080

✅ **आपका Finance Dashboard दिखना चाहिए!**

### Useful Docker Commands

```bash
# Running containers देखें
docker ps

# सभी containers देखें
docker ps -a

# Container stop करें
docker stop finance-app

# Container remove करें
docker rm finance-app

# Container फिर से start करें
docker start finance-app

# Logs देखें
docker logs finance-app

# Container के अंदर जाएं
docker exec -it finance-app sh
```

---

## Phase 4: DockerHub {#phase-4}

### Step 1: DockerHub Login करें

**Command Prompt में:**
```bash
docker login
```

**Enter करें:**
- Username: आपका DockerHub username
- Password: आपका DockerHub password

**Success message:**
```
Login Succeeded
```

### Step 2: Image Tag करें

```bash
docker tag finance-dashboard YOUR_DOCKERHUB_USERNAME/finance-dashboard:latest
```

**⚠️ Important:** `YOUR_DOCKERHUB_USERNAME` को अपने DockerHub username से replace करें!

**Example:**
```bash
docker tag finance-dashboard rahul123/finance-dashboard:latest
```

### Step 3: Image Push करें

```bash
docker push YOUR_DOCKERHUB_USERNAME/finance-dashboard:latest
```

**Example:**
```bash
docker push rahul123/finance-dashboard:latest
```

**Output देखेंगे:**
```
The push refers to repository [docker.io/rahul123/finance-dashboard]
abc123: Pushed
def456: Pushed
latest: digest: sha256:abc123... size: 1234
```

**⏱️ Time:** 1-2 minutes (internet speed पर depend करता है)

### Step 4: Verify करें

1. Browser में जाएं: https://hub.docker.com
2. Login करें
3. "Repositories" पर क्लिक करें
4. `finance-dashboard` दिखना चाहिए!

✅ **अब कोई भी आपकी image download कर सकता है:**
```bash
docker pull YOUR_USERNAME/finance-dashboard:latest
```

---

## Phase 5: Jenkins Setup {#phase-5}

### Step 1: Jenkins Container Run करें

**Command Prompt में:**
```bash
docker run -d -p 8081:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
```

**Explanation:**
- `-p 8081:8080` = Jenkins port 8081 पर चलेगा
- `-v jenkins_home:/var/jenkins_home` = data save रहेगा
- `jenkins/jenkins:lts` = stable version

**⏱️ Time:** पहली बार 3-5 minutes लग सकते हैं

### Step 2: Initial Password लें

**Wait करें 2-3 minutes, फिर:**
```bash
docker logs jenkins
```

**या direct password लें:**
```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

**Output (example):**
```
a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
```

**⚠️ इस password को copy करें!**

### Step 3: Jenkins Setup करें

1. **Browser खोलें:** http://localhost:8081
2. **Password paste करें** जो आपने copy किया
3. **"Install suggested plugins"** select करें
4. **Wait करें** (5-10 minutes) plugins install होने तक
5. **Admin User बनाएं:**
   - Username: `admin`
   - Password: `admin123` (या कोई भी)
   - Full name: आपका नाम
   - Email: आपकी email
6. **"Save and Continue"** → **"Save and Finish"** → **"Start using Jenkins"**

### Step 4: Required Plugins Install करें

1. **Dashboard पर जाएं**
2. **"Manage Jenkins"** (left sidebar)
3. **"Plugins"** पर क्लिक करें
4. **"Available plugins"** tab
5. **Search करें और install करें:**
   - `Docker Pipeline`
   - `GitHub Integration`
   - `Credentials Binding`
6. **"Install without restart"** select करें
7. **Wait करें** install होने तक

### Step 5: DockerHub Credentials Add करें

1. **Dashboard → Manage Jenkins → Credentials**
2. **"(global)"** पर क्लिक करें
3. **"Add Credentials"** (left sidebar)
4. **Fill करें:**
   - Kind: `Username with password`
   - Scope: `Global`
   - Username: आपका DockerHub username
   - Password: आपका DockerHub password
   - ID: `dockerhub-credentials` (exactly यही लिखें!)
   - Description: `DockerHub Login`
5. **"Create"** क्लिक करें

### Step 6: Jenkinsfile Update करें

**File खोलें:** `time-capsule/Jenkinsfile`

**Replace करें:**
```groovy
DOCKER_IMAGE = "YOUR_DOCKERHUB_USERNAME/finance-dashboard"
```

**Example:**
```groovy
DOCKER_IMAGE = "rahul123/finance-dashboard"
```

**और:**
```groovy
git branch: 'main', url: 'https://github.com/YOUR_USERNAME/finance-dashboard.git'
```

**Example:**
```groovy
git branch: 'main', url: 'https://github.com/rahul123/finance-dashboard.git'
```

**Save करें और Git push करें:**
```bash
git add Jenkinsfile
git commit -m "Updated Jenkinsfile with usernames"
git push origin main
```

### Step 7: Pipeline Job बनाएं

1. **Jenkins Dashboard पर जाएं**
2. **"New Item"** (left sidebar)
3. **Enter name:** `finance-dashboard-pipeline`
4. **Select:** `Pipeline`
5. **"OK"** क्लिक करें
6. **Configuration में:**
   - **Pipeline section में जाएं**
   - **Definition:** `Pipeline script from SCM`
   - **SCM:** `Git`
   - **Repository URL:** `https://github.com/YOUR_USERNAME/finance-dashboard.git`
   - **Branch:** `*/main`
   - **Script Path:** `Jenkinsfile`
7. **"Save"** क्लिक करें

### Step 8: First Build Run करें

1. **Pipeline page पर "Build Now"** क्लिक करें
2. **Build History में #1 दिखेगा**
3. **#1 पर क्लिक करें → "Console Output"**
4. **Watch करें** build process

**Stages देखेंगे:**
- ✅ Checkout (GitHub से code लेना)
- ✅ Build Docker Image
- ✅ Push to DockerHub
- ✅ Deploy (container run करना)

**⏱️ Time:** 5-10 minutes (पहली बार)

✅ **Success message देखेंगे:** "Pipeline completed successfully!"

---

## Phase 6: Complete CI/CD Test {#phase-6}

### Test 1: UI Change करें

1. **File खोलें:** `time-capsule/styles.css`

2. **Line 6 पर color change करें:**
```css
/* पुराना */
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

/* नया */
background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
```

3. **Save करें**

4. **Git push करें:**
```bash
git add styles.css
git commit -m "Changed background color to pink"
git push origin main
```

5. **Jenkins check करें:**
   - Dashboard पर जाएं
   - Automatically build start होगा (1-2 minutes में)
   - Build complete होने तक wait करें

6. **Test करें:**
   - Browser खोलें: http://localhost:8080
   - Refresh करें (Ctrl + F5)
   - Background color pink होना चाहिए!

### Test 2: Feature Add करें

1. **File खोलें:** `time-capsule/script.js`

2. **Line 1 के बाद add करें:**
```javascript
console.log('Finance Dashboard v2.0 - CI/CD Working!');
```

3. **Save और push करें:**
```bash
git add script.js
git commit -m "Added console log"
git push origin main
```

4. **Jenkins automatically build करेगा**

5. **Test करें:**
   - http://localhost:8080 खोलें
   - F12 दबाएं (Developer Tools)
   - Console tab में message दिखना चाहिए!

✅ **CI/CD काम कर रहा है!** हर push पर automatic deployment हो रही है!

---

## Troubleshooting {#troubleshooting}

### Problem 1: Docker Desktop Start नहीं हो रहा

**Solution:**
1. Task Manager खोलें (Ctrl + Shift + Esc)
2. "Docker Desktop" find करें और End Task करें
3. Docker Desktop फिर से खोलें
4. अगर फिर भी नहीं चले तो PC restart करें

### Problem 2: Port 8080 Already in Use

**Error:**
```
Error: bind: address already in use
```

**Solution:**
```bash
# Process find करें
netstat -ano | findstr :8080

# Output में last column में PID होगा (example: 1234)
# उस process को kill करें
taskkill /PID 1234 /F

# या पुराना container stop करें
docker stop finance-app
docker rm finance-app
```

### Problem 3: Git Push नहीं हो रहा

**Error:**
```
fatal: Authentication failed
```

**Solution:**
1. GitHub Personal Access Token बनाएं (Phase 2 में steps हैं)
2. Password की जगह token use करें
3. या Git Credential Manager install करें

### Problem 4: Docker Build Fail हो रहा

**Error:**
```
ERROR: failed to solve
```

**Solution:**
1. Docker Desktop running है check करें
2. Internet connection check करें
3. Dockerfile में typo check करें
4. फिर से try करें:
```bash
docker build -t finance-dashboard . --no-cache
```

### Problem 5: Jenkins Pipeline Fail हो रहा

**Common Issues:**

**Issue A: Jenkinsfile में wrong username**
- Jenkinsfile खोलें
- DockerHub और GitHub username check करें
- Correct करें और push करें

**Issue B: DockerHub credentials wrong**
- Jenkins → Manage Jenkins → Credentials
- dockerhub-credentials edit करें
- Correct username/password डालें

**Issue C: Docker not accessible**
- Docker Desktop running है check करें
- Jenkins container restart करें:
```bash
docker restart jenkins
```

### Problem 6: Application localhost:8080 पर नहीं खुल रहा

**Check करें:**
```bash
# Container running है?
docker ps

# Logs देखें
docker logs finance-app

# Container restart करें
docker restart finance-app
```

### Problem 7: Jenkins localhost:8081 पर नहीं खुल रहा

**Solution:**
```bash
# Jenkins container status check करें
docker ps -a | findstr jenkins

# अगर stopped है तो start करें
docker start jenkins

# Logs देखें
docker logs jenkins
```

---

## 🎯 Quick Reference Commands

### Git Commands
```bash
git status                          # Changes देखें
git add .                           # सभी changes add करें
git commit -m "message"             # Commit करें
git push origin main                # Push करें
git pull origin main                # Latest code लें
git log --oneline                   # Commit history देखें
```

### Docker Commands
```bash
docker ps                           # Running containers
docker ps -a                        # सभी containers
docker images                       # सभी images
docker build -t name .              # Image build करें
docker run -d -p 8080:80 name       # Container run करें
docker stop container_name          # Stop करें
docker rm container_name            # Remove करें
docker logs container_name          # Logs देखें
docker exec -it container_name sh   # Container में enter करें
```

### Jenkins Commands
```bash
docker logs jenkins                 # Jenkins logs
docker restart jenkins              # Jenkins restart
docker stop jenkins                 # Jenkins stop
docker start jenkins                # Jenkins start
```

---

## 📊 Final Checklist

### Phase 1: Application
- [ ] index.html browser में खुल रहा है
- [ ] Transaction add हो रहा है
- [ ] Charts दिख रहे हैं

### Phase 2: Git & GitHub
- [ ] Git installed है
- [ ] GitHub account बना है
- [ ] Repository बनाई है
- [ ] Code push हो गया है
- [ ] GitHub पर files दिख रही हैं

### Phase 3: Docker
- [ ] Docker Desktop installed है
- [ ] Docker running है
- [ ] Image build हो गई है
- [ ] Container run हो रहा है
- [ ] localhost:8080 पर app दिख रहा है

### Phase 4: DockerHub
- [ ] DockerHub account बना है
- [ ] Docker login हो गया है
- [ ] Image push हो गई है
- [ ] DockerHub पर image दिख रही है

### Phase 5: Jenkins
- [ ] Jenkins container run हो रहा है
- [ ] localhost:8081 पर Jenkins खुल रहा है
- [ ] Plugins install हो गए हैं
- [ ] DockerHub credentials add हो गए हैं
- [ ] Pipeline job बन गई है
- [ ] Jenkinsfile update हो गई है
- [ ] First build successful है

### Phase 6: CI/CD
- [ ] Code change करके push किया
- [ ] Jenkins automatically build हुआ
- [ ] Deployment successful हुई
- [ ] Changes localhost:8080 पर दिख रहे हैं

---

## 🎉 Congratulations!

आपने successfully complete कर लिया:

✅ **Personal Finance Dashboard** - Full-featured web application
✅ **Git & GitHub** - Version control और code hosting
✅ **Docker** - Application containerization
✅ **DockerHub** - Container registry
✅ **Jenkins** - CI/CD pipeline automation
✅ **Complete DevOps Workflow** - Production-ready setup

**अब आप:**
- Code change करो → Git push करो → Automatic deployment हो जाएगी!
- Professional DevOps project portfolio में add कर सकते हो
- Resume में mention कर सकते हो
- Interview में explain कर सकते हो

---

## 📞 Need Help?

**Common Resources:**
- Docker Docs: https://docs.docker.com
- Jenkins Docs: https://www.jenkins.io/doc
- Git Docs: https://git-scm.com/doc

**YouTube Tutorials:**
- Search: "Docker tutorial Hindi"
- Search: "Jenkins CI/CD Hindi"
- Search: "DevOps project Hindi"

---

**Made with ❤️ for DevOps Learners**

**Happy Learning! 🚀**
