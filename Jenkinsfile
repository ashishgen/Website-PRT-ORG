pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials("fd0f9686-f9a9-49f0-bd94-5e3758d38855")
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
                sh "sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
                sh "sudo docker build . /home/ubuntu/jenkins/workspace/Test -t ashishpandey63342/prt-task"
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
