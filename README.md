# 💰 Personal Finance Dashboard

A complete front-end personal finance tracking application with CI/CD pipeline.

## Features
- ✅ Track income & expenses
- ✅ Categorize transactions
- ✅ Monthly budget tracking with alerts
- ✅ Pie chart (expenses by category)
- ✅ Line chart (balance over time)
- ✅ Export/Import (JSON & CSV)
- ✅ LocalStorage persistence
- ✅ Responsive design

## Tech Stack
- HTML5, CSS3, JavaScript (Vanilla)
- Canvas API for charts
- No external libraries

## Quick Start

### Local Development
```bash
# Open index.html in browser
```

### Docker
```bash
# Build image
docker build -t finance-dashboard .

# Run container
docker run -d -p 8080:80 finance-dashboard

# Access at http://localhost:8080
```

### Docker Commands
```bash
# Stop container
docker stop finance-app

# Remove container
docker rm finance-app

# View logs
docker logs finance-app
```

## CI/CD Pipeline

### Prerequisites
- Git & GitHub account
- Docker Desktop installed
- DockerHub account
- Jenkins installed

### Setup Steps

1. **Initialize Git**
```bash
git init
git add .
git commit -m "Initial commit: Finance Dashboard"
```

2. **Push to GitHub**
```bash
git remote add origin https://github.com/YOUR_USERNAME/finance-dashboard.git
git branch -M main
git push -u origin main
```

3. **Build & Push Docker Image**
```bash
docker build -t YOUR_USERNAME/finance-dashboard .
docker login
docker push YOUR_USERNAME/finance-dashboard:latest
```

4. **Configure Jenkins**
- Install Docker Pipeline plugin
- Add DockerHub credentials (ID: `dockerhub-credentials`)
- Create Pipeline job pointing to your GitHub repo
- Update Jenkinsfile with your DockerHub username

5. **Run Pipeline**
- Click "Build Now" in Jenkins
- Watch automated build, push, and deploy

## Project Structure
```
time-capsule/
├── index.html          # Main HTML
├── styles.css          # Styling
├── script.js           # Application logic
├── Dockerfile          # Container configuration
├── Jenkinsfile         # CI/CD pipeline
└── README.md           # Documentation
```

## Currency
Uses Indian Rupee (₹) symbol

## Browser Support
- Chrome, Firefox, Safari, Edge (latest versions)

## License
MIT
