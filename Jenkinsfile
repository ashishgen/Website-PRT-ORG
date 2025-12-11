pipeline {
    environment {
        // Define DockerHub credentials and extract username and password
        DOCKERHUB_CREDENTIALS = credentials("bbc3b5d3-2472-4914-a57b-4150fa64f034")
        BRANCH_NAME = 'main'  // Define the branch name (or pass it as a parameter)
    }
    agent {
        label "J-M"  // Agent where the pipeline will run
    }

    stages {
        // Git Stage
        stage('Git') {
            steps {
                script {
                    // Checkout the specified branch from the GitHub repository
                    git branch: "${main}", url: 'https://github.com/ashishgen/Website-PRT-ORG.git'
                }
            }
        }

        // Docker Stage
        stage('Docker') {
            steps {
                script {
                    // Docker login using credentials from Jenkins
                    sh "sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
                    sh "sudo docker build -t ashishpandey63342/prt-task ."
                    sh "sudo docker push ashishpandey63342/prt-task"
                }
            }
        }

        // Kubernetes Stage
        stage('k8s') {
            steps {
                script {
                    // Apply Kubernetes deployment and service files
                    sh "kubectl apply -f deploy.yaml"
                    sh "kubectl apply -f service.yaml"
                }
            }
        }
    }
}
