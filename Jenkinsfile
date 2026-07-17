pipeline {
    agent any
    
    branch 'main'

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/kumardhruv27/see.git'
            }
        }

        stage('Build Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t myapp ."
            }
        }

        stage('Deploy to Docker Swarm') {
            steps {
                sh """
                    docker service rm java-service || true
                    docker service create \
                      --name java-service \
                      -p 8080:8080 \
                        myapp:latest
                """
            }
        }
    }
}
