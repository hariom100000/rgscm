pipeline {
    agent any
    environment {
    MY_CRED = credentials('serviceprincipal')
  }
    
    options {
       ansiColor('xterm')
       timestamps()
       timeout(time: 1, unit: 'HOURS')
        retry(2)
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
      stage('project review'){
        steps{
            script {
                //determine the selection
                def action = params.plan ? 'plan' : (params.apply ? 'apply' : (params.Destroy ? 'Destroy' : 'None'))
                
                echo "project details:\n"
                echo "\tEnvironment \t: ${params.environment}"
                echo "\n\t Action \t : ${action}"
                input message: 'Please verify and confirm the project details \nProceed or Abort',
                    ok: 'Proceed'
        }
      }
       stage('approval') {
            when {
                allOf {
                    branch 'InfraDeploy-Plan'
                    environment name: 'envname', value: 'dev'
                }
            }
            input {
                message "Kya aap is deploy ko approve karte hai?"
                submitter "har"
                submitterParameter "APPROVED_BY"
            }
            steps {
                echo "Approved by: ${env.APPROVED_BY}"
            }
        }
        stage('Check Plan Param') {
            steps {
                script {
                    if (params.plan) {
                        echo "✔️ Plan parameter is true. Terraform Plan chalega."
                    } else {
                        echo "❌ Plan parameter is false. Skipping Terraform Plan."
                    }
                }
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
