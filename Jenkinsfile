pipeline{
    agent any
    stages{
        stage("Git Chechkout from SCM"){
            steps{
                git branch: 'main', url: 'https://github.com/anuragjos/java-app-demo.git'
            }
        }
    }
}