pipeline {
    agent {
        cms-dmwm-el9-01 { image 'node:20.11.1-alpine3.19' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
