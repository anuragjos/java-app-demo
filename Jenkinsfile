@Library('my-shared-library') _
pipeline{
    agent any

    parameters{
        choice (name: 'action',choices: 'create\ndelete', description: 'Choose create/Destroy')
    }

    stages{
        
        stage("Git Chechkout from SCM"){
            when { expression {param.action == 'create'} }
        
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
        stage("Maven Integration Testing") {
         when { expression {param.action == 'create'} }
            steps{
                script{
                    mvnInteragrationTest()
                }
                
            }
        }
        stage("Static Code Analysis: Sonarqube") {
         when { expression {param.action == 'create'} }
            steps{
                script{
                    staticCodeAnalysis()
                }
                
            }
        }
    }
}