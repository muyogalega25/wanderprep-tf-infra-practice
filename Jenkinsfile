def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger'
]
pipeline {
    agent any
    
    parameters {
        choice(
            name: 'action',
            choices: ['apply', 'destroy'],
            description: 'Terraform action to perform'
        )
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    
    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning codebase from Github to Jenkins'
                git branch: 'main', credentialsId: 'git-credential', url: 'https://github.com/muyogalega25/wanderprep-tf-infra-practice.git'
                
                // Just remove the Windows binary, don't install Terraform
                sh 'rm -f terraform.exe'
            }
        }
       
        stage('Use Stable Terraform') {
            steps {
                script {
                    // Download stable Terraform version
                    sh '''
                        wget -q https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip
                        unzip -o terraform_1.5.7_linux_amd64.zip
                        chmod +x terraform
                    '''
                    // Update PATH to use downloaded version instead of Jenkins tool
                    env.PATH = "${WORKSPACE}:${env.PATH}"
                }
            }
        } 
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('Terraform Apply/Destroy') {
            steps {
                script {
                    sh "terraform ${params.action} --auto-approve"
                }
            }
        }
    }
    
    post {
        always {
            echo 'sending build result!'
            slackSend(
                channel: '#wanderprep-infra-team', 
                color: COLOR_MAP[currentBuild.currentResult], 
                message: "Build done by Mike - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
            )
        }
    }
}
