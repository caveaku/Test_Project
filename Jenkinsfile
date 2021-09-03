pipeline {
    agent any
    tools {
        maven 'maven3.8'
        jdk 'jdk'
    }
    environment { 
        AWS_REGION = 'us-east-1'
        ECRREGISTRY = '464599248654.dkr.ecr.us-east-1.amazonaws.com'
        IMAGENAME = 'kojibello-tomcat'
        IMAGE_TAG = 'latest'
    }
    stages {
       stage ('Cloning git') {
          steps {
                checkout scm
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
              withSonarQubeEnv('sonnar-scanner') {
                sh "mvn clean package sonar:sonar -Dsonar.host.url=http://34.209.124.127:9000 -Dsonar.login=cc92b9fece4552a752667e25ff8a1064f7447e3d -Dsonar.projectKey=jenkins -Dsonar.projectName=haplet -Dsonar.projectVersion=1.0"
              }
            }
          }
           stage('Deployment Approval') {
            steps {
              script {
                timeout(time: 20, unit: 'MINUTES') {
                 input(id: 'Deploy Gate', message: 'Deploy Application to Dev ?', ok: 'Deploy')
                 }
               }
            }
           } 
        stage('docker build and tag') {
            steps {
                //sh 'cp ./webapp/target/webapp.* .'
                 sh 'docker build -t ${IMAGENAME}:${IMAGE_TAG} .'
                  //sh 'docker tag ${IMAGENAME}:${IMAGE_TAG} ${ECRREGISTRY}/${IMAGENAME}:${IMAGE_TAG}'
            }
        }  
        }
}
