def image

pipeline {
    agent any
    environment{
        DOCKER_TAG = getDockerTag()
    }
    stages {
        stage('Build') {                 
            steps {                
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
                    docker.withRegistry("https://421775237038.dkr.ecr.ap-south-1.amazonaws.com", "ecr:ap-south-1:ecr_mirror") {
                        docker.image("ecrrepo").push()
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
    // post {
    //     always {
    //         /*deleteDir() /* clean up our workspace */
    //     }
    // }
}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
