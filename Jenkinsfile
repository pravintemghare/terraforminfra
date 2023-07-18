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

/*       stage('Terraform init') {
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
        }     */   
        
        stage('Infrastructure Deploy') {
            steps {
                script {
                    if (params.action == 'apply') {
                        echo "Terraform action is --> ${action}"                        
/*                        dir('infra'){
                            sh ('terraform ${action} --auto-approve')
                        } */
                    } else {
                        echo "Terraform action is --> ${action}"
                        echo "Destroying infrastructure..."                        
/*                        dir('infra'){
                            sh ('terraform ${action} --auto-approve')
                        } */
                        currentBuild.result = "SUCCESS"
                        return
                    }                    
                }
            }

        }

        stage('Ansible') {
            when { expression { params.action == 'apply' } }
            steps {
                echo "Test Ansible"
            }
        }
    }        
}