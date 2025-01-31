pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nizarbsalem/hello-word:latest'
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'
        GITHUB_REPO = 'https://github.com/nizarbs2508/hello-word.git'
    }

    tools {
        jdk 'JDK 19'
        maven 'Maven 3.9.9'  // Nom de l'installation que vous avez configurée
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/nizarbs2508/hello-word.git'
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
