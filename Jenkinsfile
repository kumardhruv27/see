

pipeline{
    agent any
    cron('H 0 * * *')

    stages{
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Deploy'){
            steps{
                sh 'mvn deploy'
            }
        }
        stage('docker'){
            steps{
                sh 'docker build -t demo:latest .'
                sh 'docker run -d -p 8081:8081 demo:latest'
            }
        }stage('swarm'){
            steps{
                sh 'docker swarm init'
                sh 'docker stack deploy -c docker-compose.yml demo'
            }
        }
    }
}