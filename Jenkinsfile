def image

pipeline {
    agent any
    environment{
        DOCKER_TAG = getDockerTag()
    }
    stages {
        stage('Build') {                 
            steps {
                cleanWc()
                script {
                    image = docker.build("macprasanna/sample-tomcat:${TAG}")
                }                
            }
        }   
        stage('Smoke Test') {
            steps {
                script {
                    container = image.run()
                    container.stop()
              }
            }
        }
        stage('Push') {                 
            steps { 
                script {
                    withDockerRegistry([credentialsId: "docker-hub", url: "" ]) {        
                        image.push()
                    }     
                }
            }
        }
        stage('SCM') {                 
            steps {            
                withCredentials([usernamePassword(credentialsId: 'git_mirror', passwordVariable: 'GIT_PWD', usernameVariable: 'GIT_USER_NAME')]){                
                    echo 'clonning with credentials'
                    sh 'chmod +x ./push.sh'
                    sh "./push.sh ${TAG}"                    
                    echo 'git push successful'                    
                }                               
            }
        }
    }
}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
