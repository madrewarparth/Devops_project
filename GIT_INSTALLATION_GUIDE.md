# 🔧 Git Installation Guide for Windows

## Step 1: Download Git
1. Go to: https://git-scm.com/download/win
2. Click "Download for Windows"
3. Download will start automatically

## Step 2: Install Git
1. Run the downloaded `.exe` file
2. Click "Next" for all default options
3. **Important**: Make sure "Git from the command line and also from 3rd-party software" is selected
4. Complete installation
5. **Restart your computer** (important!)

## Step 3: Verify Installation
1. Open Command Prompt (cmd)
2. Type: `git --version`
3. You should see Git version number

## Step 4: Configure Git (First time only)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 5: Run GitHub Push
After Git installation, double-click: `GITHUB_PUSH_COMPLETE.bat`

---

## Alternative: GitHub Desktop (Easier)
If you prefer GUI:
1. Download GitHub Desktop: https://desktop.github.com/
2. Install and login with GitHub account
3. Clone your repository: https://github.com/madrewarparth/Devops_project.git
4. Copy your project files to the cloned folder
5. Commit and push using GitHub Desktop

---

## Troubleshooting

### Git command not found after installation?
- Restart Command Prompt
- Restart your computer
- Check if Git is in PATH environment variable

### Authentication failed?
- Use Personal Access Token instead of password
- Go to GitHub → Settings → Developer settings → Personal access tokens
- Generate new token with repo permissions
- Use token as password when prompted

### Repository already exists error?
```bash
git remote set-url origin https://github.com/madrewarparth/Devops_project.git
git push -u origin main --force
```