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
    }
}
