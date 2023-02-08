pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mvn"
    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/NguyenTienHCL/CI-CD-using-Docker.git'
            }
        }
        
        stage('execute maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('build image') {
            steps {
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp tiennguyenhcl/samplewebapp:latest'
            }    
        }
        
        stage('run container') {
            steps {
                sh "docker run -d -p 8090:8080 tiennguyenhcl/samplewebapp"
            }
        }
        
        stage('Run Docker container on remote hosts') {
             steps {
                sh "docker -H ssh://jenkins@3.38.107.165 run -d -p 8090:8080 tiennguyenhcl/samplewebapp"
             }
        }
    }
}
