pipeline {
    agent any

    parameters {
        choice(name: 'TERRAFORM_ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action to perform')
    }
    
    environment {
        AZURE_CREDENTIALS_ID = 'azure-sp-credentials'
        AZURE_RESOURCE_GROUP = 'lili-rg'
        AZURE_REGION = 'eastus'
        ACR_NAME = 'demo_ecr'
        AKS_NAME = 'demo_aks'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh "terraform plan -out=tfplan -input=false \
                          -var 'acr_name=${ACR_NAME}' \
                          -var 'aks_name=${AKS_NAME}' \
                          -var 'resource_group_name=${AZURE_RESOURCE_GROUP}' \
                           -var 'azure_region=eastus'"
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
