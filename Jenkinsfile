node {
    stage('checkout') {
        git branch: 'master', url: 'https://github.com/NguyenTienHCL/CI-CD-using-Docker.git'
    }

    stage('execute maven') {
        sh 'mvn clean package'
    }

    stage('build image') {
        sh 'docker build -t samplewebapp:latest .' 
        sh 'docker tag samplewebapp tiennguyenhcl/samplewebapp:latest'
    }

    stage("Deploy docker image to Tomcat server") {
        def dockerRun = 'docker run -d -p 8888:8080 tiennguyenhcl/samplewebapp'
        sshagent(['dev-server']) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.10.133 ${dockerRun}"
        }
    }
}
