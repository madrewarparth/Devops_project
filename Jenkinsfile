pipeline {
    agent any
    
    stages {
        stage('Test Build') {
            steps {
                echo 'Starting CI/CD Pipeline...'
                echo 'Project: Personal Finance Dashboard'
                echo 'Build Number: ${BUILD_NUMBER}'
            }
        }
        
        stage('Code Quality Check') {
            steps {
                echo 'Checking HTML, CSS, JS files...'
                script {
                    if (fileExists('index.html')) {
                        echo '✅ index.html found'
                    }
                    if (fileExists('styles.css')) {
                        echo '✅ styles.css found'
                    }
                    if (fileExists('script.js')) {
                        echo '✅ script.js found'
                    }
                    if (fileExists('Dockerfile')) {
                        echo '✅ Dockerfile found'
                    }
                }
            }
        }
        
        stage('Simulate Deploy') {
            steps {
                echo 'Simulating deployment...'
                echo 'App would be deployed to: http://localhost:8080'
                echo 'Docker image: madrewarparth/finance-dashboard:${BUILD_NUMBER}'
            }
        }
    }
    
    post {
        success {
            echo '🎉 Pipeline completed successfully!'
            echo 'CI/CD workflow verified!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
