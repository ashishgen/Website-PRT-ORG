pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials("5f112d22-f698-47e6-be10-bba89c873d6b")
    }
    agent {
        label "K-M"
    }
    stages {
        stage('Git') {
            steps {
                git branch: 'main', url: 'https://github.com/ashishgen/Website-PRT-ORG.git'
            }
        }
        stage('Docker') {
            steps {
                script {
                    // Build the Docker image
                    sh 'sudo docker build -t ashishpandey1991/newproject:latest .'

                    // Login to Docker Hub using credentials
                    withCredentials([usernamePassword(credentialsId: '5f112d22-f698-47e6-be10-bba89c873d6b', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'sudo docker login -u $DOCKER_USER -p $DOCKER_PASS'
                    }

                    // Push the Docker image to Docker Hub
                    sh 'sudo docker push ashishpandey1991/newproject'
                }
            }
        }
        stage('K-M') {
            agent {
              label "K-M"
               }
            steps {
                // Apply Kubernetes Deployment and Service
                sh "kubectl apply -f deploy.yaml"
                sh "kubectl apply -f service.yaml"
            }
        }
    }
}
