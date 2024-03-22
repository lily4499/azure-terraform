pipeline {
    agent any

    parameters {
        choice(name: 'TERRAFORM_ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action to perform')
    }
    
    stages {
     //   stage('Azure Login') {
          //  steps {
                // Authenticate using Azure CLI with user credentials
               // sh 'az login'
      //      }
     //   }
        
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/lily4499/azure-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
              //      withCredentials([azureServicePrincipal(credentialsId: 'azure-sp-credentials', tenantIdVariable: 'AZURE_TENANT_ID', clientIdVariable: 'AZURE_CLIENT_ID', clientSecretVariable: 'AZURE_CLIENT_SECRET')]) {
                    sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    if (params.TERRAFORM_ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (params.TERRAFORM_ACTION == 'destroy') {
                        sh 'terraform destroy -auto-approve'
                    } else {
                        error 'Invalid Terraform action specified!'
                    }
                }
            }
        }
    }
}
