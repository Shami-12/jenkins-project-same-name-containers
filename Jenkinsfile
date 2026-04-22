pipeline {
agent any

```
environment {
    BASE_NAME = "my-app"
    IMAGE_NAME = "my-app-image"
    REPO_URL = "https://github.com/Shami-12/jenkins-project-same-name-containers.git"
    BRANCH = "main"
}

stages {

    stage('Checkout from GitHub') {
        steps {
            git branch: "${BRANCH}", url: "${REPO_URL}"
        }
    }

    stage('Build Docker Image') {
        steps {
            sh '''
            docker build -t $IMAGE_NAME ./docker
            '''
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
```

}

