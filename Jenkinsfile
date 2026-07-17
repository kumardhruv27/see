pipeline {
    agent any

    stages {
        stage('Clone') {
            when {
                branch 'main'
            }
            steps {
                git 'https://github.com/kumardhruv27/see.git'
            }
        }

        stage('Build Maven') {
            when {
                branch 'main'
            }
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            when {
                branch 'main'
            }
            steps {
                sh "docker build -t myapp ."
            }
        }

        stage('Deploy to Docker Swarm') {
            when {
                branch 'main'
            }
            steps {
                sh """
                    docker service rm java-service || true
                    docker service create \
                      --name java-service \
                      -p 8081:8081 \
                        myapp:latest
                """
            }
        }
    }
}
