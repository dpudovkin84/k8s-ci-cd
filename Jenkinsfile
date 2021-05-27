pipeline {
    agent any
    environment {
        DOCKER_TAG=_NAME =getDockerTag()
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t dpudovkin84/my_docker_hub:${DOCKER_TAG}"
                echo 'Building............'
                echo 'End of stage Build'
            }
        }
    }
  }  

def getDockerTag(){
    def tag = sh script: "git rev-parse HEAD", return Stdout: true
    return tag
  }

}