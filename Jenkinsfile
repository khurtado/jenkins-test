pipeline {
    agent {
	docker {
		label 'cms-dmwm-el9-01'
		image 'node:20.12.2'
	}
    }
    stages {
        stage('Test') {
		steps {
			sh 'node --version'
		}
        }
    }
}
