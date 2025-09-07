pipeline {
    agent any

    stages {
        stage('terrform-version') {
            steps {
               sh '''
                 terraform version
                 az version
                '''
                
            }
        }
        stage('terraform-init') {
            steps {
              sh 'terraform init'
            }
        }
        stage('terraform-plan') {
            steps {
              sh 'terraform plan'
            }
        }
        stage('terraform-apply') {
            steps {
              sh 'terraform apply -auto-approve'
            }
        }
    }
}
