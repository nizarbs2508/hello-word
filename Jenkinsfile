pipeline {
    agent any

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

        stage('Debug') {
            steps {
                bat 'where cmd'
                bat 'cmd /c echo CMD is working'
            }
        }

        stage('Build') {
            steps {
                script {
                     withEnv(["PATH+MAVEN=C:\\Program Files\\Java\\apache-maven-3.9.9-bin\\apache-maven-3.9.9\\bin"]) {
                    bat 'mvn clean install'
                }
            }
        }
        }
         stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        

         stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials-id', url: '']) {
                        bat "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    bat "kubectl apply -f ${K8S_DEPLOYMENT}"
                }
            }
        }
    }
}
