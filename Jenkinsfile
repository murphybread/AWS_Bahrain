pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git checkout') {
           steps{
                git 'https://github.com/HelloSleep/AWS_Bahrain.git'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'echo "this action will apply terraform resource"'
          script {
              if(params.ACTION =='apply'){
                  sh 'terraform apply -auto-approve'
              }
          }
            }
        }
        stage('choice terraform destroy'){
          steps{
            sh 'echo "this action will destroy terraform resource"'
          script {
              if(params.ACTION =='destroy'){
                  sh 'terraform destroy -auto-approve'
              }
          }
          }
        }
    }
     post {
        always{
            sh 'terraform state list'
        }
    
        success {
 		slackSend channel: 'devops', message: 'Bahrain region is builded succesed'
	}
	
	failure {
	 		slackSend channel: 'devops', message: 'Bahrain region build is failed'
	 }
	
    
    }
}
