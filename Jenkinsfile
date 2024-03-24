pipeline {
    agent any

    parameters {
        choice(name: 'TERRAFORM_ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action to perform')
    }

    environment {
        TF_VAR_client_id = credentials('lil-sp-client-id')
        TF_VAR_client_secret = credentials('lil-sp-client-secret-id')
        TF_VAR_tenant_id = credentials('lil-sp-tenant-id')
        TF_VAR_subscription_id = credentials('lil-sp-subscription-id')
    }
    
    stages {
       stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/lily4499/azure-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
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
