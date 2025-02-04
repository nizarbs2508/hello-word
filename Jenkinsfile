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
                    bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" build -t nizarbsalem/hello-word-app:latest .'
                }
            }
        }

        

         stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dckr_pat_w7wZhLp7N18lE4NTB-tqPWsVvuY', url: '']) {
                       bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" push nizarbsalem/hello-word-app:latest --disable-content-trust'
                    }
                }
            }
        }
        
     stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo "Setting up Kubernetes environment"
                    bat """
                    set PATH=%PATH%;C:\\ProgramData\\chocolatey\\bin
                    kubectl version --client
                    """
                    kubectl version --client
                    bat "kubectl apply -f k8s/deployment.yaml"
                }
            }
        }
    }
}
