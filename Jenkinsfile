pipeline {
    agent any
    
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
                          -var 'resource_group_name=${AZURE_RESOURCE_GROUP}'
                           -var 'azure_region=eastus'"
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }
    }
}
