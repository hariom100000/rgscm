pipeline {
    agent any
    environment {
    MY_CRED = credentials('serviceprincipal')
  }
    options {
       ansiColor('xterm')
       timestamps()
}
 parameters { 
     booleanParam(name: 'build1', defaultValue: false, description: 'this is my build') 
     choice(name: 'environment', choices: ['dev', 'prod'], description: 'Select environment to deploy resources ?') 
     booleanParam(name: 'plan', defaultValue: false, description: 'Perform Terraform Plan ?')
     booleanParam(name: 'apply', defaultValue: false, description: 'Perform Terraform Apply ?')
     booleanParam(name: 'Destroy', defaultValue: false, description: 'Perform Terraform destroy ?')
     booleanParam(name: 'Interactive', defaultValue: false, description: 'Every action required approval ?') 
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
        // stage('terraform-apply') {
        //     steps {
        //       sh 'terraform apply -auto-approve'
        //     }
        // }
    }
}
