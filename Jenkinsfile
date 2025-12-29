pipeline {
    agent any

    parameters {
        choice(name: 'ACTION',
               choices: ['build', 'deploy', 'stop'],
               description: 'Choose pipeline action')
    }

    tools {
        jdk 'JAVA17'
        maven 'MAVEN'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/mennanvijay/java-app.git'
            }
        }

        stage('Build WAR') {
            when {
                expression { params.ACTION == 'build' || params.ACTION == 'deploy' }
            }
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            when {
                expression { params.ACTION == 'deploy' }
            }
            steps {
                sh 'docker build -t java-app:latest .'
            }
        }

        stage('Deploy Using Docker Compose') {
            when {
                expression { params.ACTION == 'deploy' }
            }
            steps {
                sh 'docker-compose up -d'
            }
        }

        stage('Stop Application') {
            when {
                expression { params.ACTION == 'stop' }
            }
            steps {
                sh 'docker-compose down'
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}

