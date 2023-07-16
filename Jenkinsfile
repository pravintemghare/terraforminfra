pipeline {
    agent any
    
    stages {
        stage('GitCheckout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: "*/master"]],
                  userRemoteConfigs: [[url: 'https://github.com/pravintemghare/terraforminfra.git',
                                       credentialsId: 'github']]
                ])    
            }
        }

        stage('Terraform init') {
            steps {
                dir('infra'){
                sh ('terraform init -reconfigure')
                }
            }
        }

        stage('Terraform plan') {
            steps {
                dir('infra'){
                sh ('terraform plan')
                }
            }
        }        
        
        stage('Terraform action') {
            steps {
                echo "Terraform action is --> ${action}"
                dir('infra'){
                sh ('terraform ${action} --auto-approve')
                }
            }
        }

        stage('Configure Server') {
            steps {
                script {
                    if (${action} == 'destroy') {
                        echo "Terraform action complete"
                        exit 0
                    } else {
                        echo "Configure Server with Ansible"
                    }
                }
            }
        }
    }
}        