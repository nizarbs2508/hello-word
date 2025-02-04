pipeline {
    agent any

    tools {
        jdk 'JDK 19'
        maven 'Maven 3.9.9'  // Nom de l'installation que vous avez configurée
    }

    environment {
        DOCKER_IMAGE = "nizarbsalem/hello-word-app"
        DOCKER_TAG = "latest"
        K8S_DEPLOYMENT = "k8s/deployment.yaml"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials-id', url: 'https://github.com/nizarbs2508/hello-word.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }

         stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        

         stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials-id', url: '']) {
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f ${K8S_DEPLOYMENT}"
                }
            }
        }
    }
}
