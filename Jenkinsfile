pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'muskansharda/MMT'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/muskanvip009/MMT-Devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                        bat "docker push %DOCKER_IMAGE%"
                        bat "docker logout"
                    }
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    bat "docker-compose down"
                    bat "docker-compose pull"
                    bat "docker-compose up -d"
                }
            }
        }
    }

    post {
        success {
            emailext subject: "Jenkins Build Successful",
                     body: "Good news! The Jenkins build and deployment were successful.",
                     to: "muskansharda009@gmail.com"
        }
        failure {
            emailext subject: "Jenkins Build Failed",
                     body: "Oops! The Jenkins build failed. Check the logs.",
                     to: "muskansharda009@gmail.com"
        }
    }
}
