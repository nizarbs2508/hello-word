pipeline {
    agent any

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
                    sh 'mvn clean install'
                }
            }
        }

        
        stage('Login to Docker') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io', 'docker-credentials-id') {
                        sh 'docker login -u nizarbsalem -p Chnanah000!'
                    }
                }
            }
        }
        
      stage('Docker Build') {
            steps {
                script {
                   sh 'docker build -t nizarbsalem/hello-word:latest .'
                   
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker login -u nizarbsalem -p Chnanah000!'
                    sh 'docker push nizarbsalem/hello-word:latest'
                }
            }
        }
         stage('Déployer') {
            steps {
                sh 'docker run -d -p 8080:8080 nizarbsalem/hello-word:latest'
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
