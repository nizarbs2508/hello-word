pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'yourusername/your-app:latest'
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'
        GITHUB_REPO = 'https://github.com/yourusername/your-app.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "$GITHUB_REPO"
            }
        }

        stage('Build') {
            steps {
                script {
                    sh './mvnw clean install'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                }
            }
        }
    }
}
