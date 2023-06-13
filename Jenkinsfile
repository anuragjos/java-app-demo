@Library('my-shared-library') _
pipeline{
    agent any

    parameters{
        choice (name: 'action',choices: 'create\ndelete', description: 'Choose create/Destroy')
        string (name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        string (name: 'ImageTag',  description: "tag of the docker build",  defaultValue: 'v1')
        string (name: 'AppName',   description: "name of the Application",  defaultValue: 'springboot')
    }

    stages{
        
        stage("Git Chechkout from SCM"){
            when { expression {params.action == 'create'} }
        
            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/anuragjos/java-app-demo.git"
                )
                
            }
        }
        stage("Unit Test Maven"){
        when { expression {params.action == 'create'} }
            steps{
                script{
                    mvnTest()
                }
                
            }
        }
        stage("Maven Integration Testing") {
         when { expression {params.action == 'create'} }
            steps{
                script{
                    mvnInteragrationTest()
                }
                
            }
        }
        stage("Static Code Analysis: Sonarqube") {
         when { expression {params.action == 'create'} }
            steps{
                script{
                    def SonarQubecredentialsId = 'sonar-api'
                    staticCodeAnalysis(SonarQubecredentialsId)
                }
                
            }
        }
        stage("Quality Gates Status Check : Sonarqube:") {
         when { expression {params.action == 'create'} }
            steps{
                script{
                    def SonarQubecredentialsId = 'sonar-api'
                    QualityGateStatus(SonarQubecredentialsId)
                }
                
            }
        }
        stage("Maven Build") {
         when { expression {params.action == 'create'} }
            steps{
                script{
                    mvnBuild()
                }
            }
        }
        stage("Docker Build") {
         when { expression {params.action == 'create'} }
            steps{
                script{
                   dockerBuild("${params.ImageName}","${params.ImageTag}","${params.AppName}")
                }
            }
        }
    }
}