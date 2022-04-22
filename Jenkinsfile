def image

pipeline {
    agent any
    stages {
        stage('Build') {                 
            steps {
                script {
                    image = docker.build("macprasanna/sample-tomcat:1.0")
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
                    sh './push.sh'                    
                    echo 'git push successful'                    
                }                               
            }
        }
    }
}
