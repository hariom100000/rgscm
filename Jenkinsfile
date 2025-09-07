pipeline {
    agent any

    stages {
        stage('terrform-version') {
            steps {
                sh 'terraform version'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
