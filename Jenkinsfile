pipeline {
    agent any

    stages {
        stage('terrform-version') {
            steps {
                sh 'terraform version'
            }
        }
        stage('terraform-init') {
            steps {
              sh 'terraform init'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
