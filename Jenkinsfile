pipeline {
    // agent any
    parameters {
        choice(name: 'AGENT_TYPE', choices: ['windows', 'linux', 'any'], description: 'Agent select karo')
    }
        
    // triggers {
    //     none()
    // }
    environment {
    MY_CRED = credentials('serviceprincipal')
  }
    stages {
      stage('azure-login') {
       steps {
          sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
      }
    }
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
