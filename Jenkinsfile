@Library('my-shared-library') _
pipeline{
    agent any

    parameters{
        choice (name: 'action',choices: 'create\ndelete', description: 'Choose create/Destroy')
    }

    stages{
        when { expression {param.action == 'create'} }
        
        stage("Git Chechkout from SCM"){
        
            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/anuragjos/java-app-demo.git"
                )
                
            }
        }
        stage("Unit Test Maven"){
        when { expression {param.action == 'create'} }
            steps{
                script{
                    mvnTest()
                }
                
            }
        }
        stage("Maven Integration Testing"){
         when { expression {param.action == 'create'} }
            steps{
                script{
                    mvnInteragrationTest()
                }
                
            }
        }
    }
}