pipeline {
    agent any
    environment {
#        DOCKER_TAG = getDockerTag()
         DOCKER_TAG = $BUILD_ID
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t dpudovkin84/my_docker_hub:${DOCKER_TAG}"
                echo 'Building............'
                echo 'End of stage Build'
            }
        }
    
        stage('Push Docker Image to Dockerhub'){
            steps{   
              withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'Dockerhubpwd')]) {
              sh "docker login -u dpudovkin84 -p ${Dockerhubpwd}"
              sh "docker push dpudovkin84/my_docker_hub:${DOCKER_TAG}"
              }        
            }
        }
    }  
}
def getDockerTag(){
    def tag = sh script: "git rev-parse HEAD", returnStdout: true
    return tag
  }


