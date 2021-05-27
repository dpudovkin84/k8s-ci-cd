pipeline {
    agent any
    environment {
         DOCKER_TAG = "v${BUILD_ID}"
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
        stage('Deploy to K8s'){
            steps{
              sh "chmod +x changeTag.sh"
              sh "./changeTag.sh ${DOCKER_TAG}"
              sshagent(['ssh-kubectl-key']) {
                 sh "scp -o StrictHostKeyChecking=no deploy-prod.yml dpudovkin@10.129.0.32:/home/dpudovkin/ci-cd/" 
                 sh "ssh dpudovkin@10.129.0.32:/ci-cd/ kubectl apply -f deploy-prod.yml"   
              }
              }
            }
        }



    }  
}
def getDockerTag(){
    def tag = sh script: "git rev-parse HEAD", returnStdout: true
    return tag
  }


