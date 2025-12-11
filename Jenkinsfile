pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials("760cedcb-ee16-4eff-89bb-6b27fc2d02f6")
    }
    agent {
        label "K-M"
    }

    stages {
        stage('Git') {
            steps {
                git 'https://github.com/ashishgen/Website-PRT-ORG.git'
            }
        }
        stage('Docker') {
            steps {
                sh "sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
                sh "sudo docker build /home/ubuntu/jenkins/workspace/Test -t ashishpandey63342/prt-task"
                sh "sudo docker push ashishpandey63342/prt-task"
            }
        }
        stage('k8s') {
            steps {
                sh "kubectl apply -f deploy.yaml"
                sh "kubectl apply -f service.yaml"
            }
        }
    }
}
