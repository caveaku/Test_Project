pipeline {
    agent any
    tools {
        maven 'maven3.8'
        jdk 'jdk'
    }
    environment { 
        AWS_REGION = 'us-east-1'
        ECRREGISTRY = '464599248654.dkr.ecr.us-east-1.amazonaws.com'
        IMAGENAME = 'demomk'
        IMAGE_TAG = 'latest'
    }
    stages {
       stage ('Cloning git') {
          steps {
                sh 'git clone https://github.com/Bkoji1150/Test_Project.git'
            }
        }
         stage('Compile') {
            steps {
                sh 'mvn clean package -DskipTests=true'
            }
        }
         stage('Unit Tests') {
            steps {
                sh 'mvn surefire:test'
            }
        }
         stage("build & SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('sonar_server') {
                sh "mvn clean package sonar:sonar"
              }
            }
          }
     }
}
