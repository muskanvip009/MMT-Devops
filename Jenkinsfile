pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-flask-app'
        CONTAINER_NAME = 'flask-container'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/muskanvip009/MMT-MakeMyTrip.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        // stage('Run Tests') {
        //     steps {
        //         script {
        //             docker.image(DOCKER_IMAGE).inside {
        //                 sh 'pytest tests/' // or your test runner
        //             }
        //         }
        //     }
        // }

        stage('Deploy with Docker Compose') {
            steps {
                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Deployed Successfully 🎉'
        }
        failure {
            echo 'Build Failed ❌'
        }
    }
}
