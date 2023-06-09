@Library('my-shared-library') _
pipeline{
    agent any
    stages{
        stage("Git Chechkout from SCM"){
            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/anuragjos/java-app-demo.git"
                )
                
            }
        }
    }
}