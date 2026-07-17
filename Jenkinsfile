pipeline {
    agent any

    environment {
        DOCKER_IMAGE  = "kumardhruv27/see-app"
        IMAGE_TAG     = "8080"
        SWARM_SERVICE = "see_web_service"
    }

    stages {
        stage('Clone') {
            when { branch 'main' }
            steps {
                echo 'SCM Checkout verified successfully.'
                sh 'git status'
            }
        }

        stage('Build Maven') {
            when { branch 'main' }
            steps {
                echo 'Starting Maven Clean Package compilation...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            when { branch 'main' }
            steps {
                echo "Building Docker Image: 8080:8080" 
                sh "docker build -t 8080:8080 ."
                sh "docker tag 8080:8080 8080:latest"
            }
        }

        stage('Deploy to Docker Swarm') {
            when { branch 'main' }
            steps {
                echo "Deploying update to Docker Swarm Cluster..."
                sh "docker service update --image 8080:8080 8080:latest"
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
            cleanWs()
        }
        success {
            echo 'Pipeline successfully executed all active stages!'
        }
        failure {
            echo 'Pipeline execution failed.'
        }
    }
}
