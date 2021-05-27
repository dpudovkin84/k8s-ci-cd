pipeline {
    agent any
    environment {
        PROJECT_NAME ='NEPTUNE'
        OWNER_NAME = 'DMITRIY'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t dpudovkin84/my_docker_hub:v1"
                echo 'Building............'
                echo 'End of stage Build'
            }
        }
    }
  }  

def getDockerTag(){
    def tag = sh "
  }

}
