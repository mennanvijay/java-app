pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', 
               choices: ['build', 'deploy', 'stop'], 
               description: 'Choose pipeline action')
    }

    tools {
        // Updated names to match what Jenkins suggested earlier
        jdk 'JAVA17'   
        maven 'MAVEN' 
    }

    stages {
        // REMOVED 'Checkout Code' stage because Jenkins does this automatically.
        
        stage('Build WAR') {
            when { 
                expression { params.ACTION == 'build' || params.ACTION == 'deploy' } 
            }
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            when { expression { params.ACTION == 'deploy' } }
            steps {
                // Ensure your Dockerfile name matches exactly (case-sensitive)
                sh 'docker build -t my-java-app:latest .'
            }
        }

        stage('Deploy Using Docker Compose') {
            when { expression { params.ACTION == 'deploy' } }
            steps {
                // Use a space instead of a hyphen for modern Docker
                // Match the filename 'Docker-compose.yml' from your screenshot
                sh 'docker compose -f Docker-compose.yml up -d'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
