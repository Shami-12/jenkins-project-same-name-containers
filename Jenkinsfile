pipeline {
    agent any

    environment {
        BASE_NAME = "my-app"
        IMAGE_NAME = "my-app-image"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME ./docker'
            }
        }

        stage('Deploy Containers') {
            steps {
                sh '''
                chmod +x scripts/deploy.sh
                ./scripts/deploy.sh
                '''
            }
        }
    }

    post {
        success {
            echo '🚀 Deployment successful from GitHub!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
