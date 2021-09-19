pipeline {
    agent any
    tools {
        maven 'M2_HOME'
        jdk 'JAVA_HOME'
    }
    environment { 
        AWS_REGION = 'us-east-1'
        ECRREGISTRY = '545135175756.dkr.ecr.us-east-1.amazonaws.com' 
        IMAGENAME = 'haplet-cave'
        IMAGE_TAG = 'latest'
        ECS_CLUSTER = 'myapp-cluster'
        ECS_SERVICE = 'myapp-service'
    }
    stages {
       stage ('Cloning git & Build') {
          steps {
                checkout scm
            }
        }
        stage('Unit Tests Execution') {
            steps {
                sh 'mvn surefire:test'
            }
        }
    }
}

