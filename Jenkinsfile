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
                echo """
  ------------------------------------------------------------------
  Project Deployment Review
  ------------------------------------------------------------------
  Environment: ${params.environment}
  Action     : ${action}
  ------------------------------------------------------------------
  """
                input message: 'Please verify and confirm the project details above. \nClick "Proceed" to countinue or Abort the build.',
                    ok: 'Proceed'
        }
      }
      }
        stage('terraform-init') {
            when {
                anyOf {
                    expression {return params.plan}
                    expression {return params.apply}
                    expression {return params.Destroy}
                }
            }
            steps {
              sh 'terraform init'
            }
        }
        stage('terraform plan only') {
            when {
                expression {return params.plan}
            }
            steps {
              sh 'terraform plan'
            }
        }
        stage('terraform plan Before Apply') {
            when {
                expression {return params.apply}
            }
            steps {
                script {
                    echo "Running Terraform plan before apply..."
                    sh 'terraform plan'
                //Step 1: General Confirmation
                input message: 'Please verify the terraform plan  and confirm to proceed in '${params.environment}' environment.",
                    ok: 'Proceed'
                //Step 2: Show allowed approvers
                def allowedApprovers = ['har']
                echo """
===========================================================
Terraform Apply Approval Required
Only the following Jenkins users can approve this action:
   ${allowedApprovers.join('\n   ')}
============================================================
"""
                //Step 3: Rstrict approval input
                def approvar = input(
                    message: "Approval required to run 'terraform apply' in '${params.environment}' environment.",
                    ok: "Approve and Apply",
                    submitter: allowedApprovers.join(',')
                    )
                //echo "Terraform Apply approved by: ${approvar}"
            }
        }
    }
        stage('Terraform Apply') {
            when {
                expression {return params.apply}
            }
            Steps {
                sh 'terraform apply -auto-approve'
            }
        }
        

