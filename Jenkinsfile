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
                dir('cd'){
                    withCredentials([usernamePassword(credentialsId: 'git', passwordVariable: 'GIT_PWD', usernameVariable: 'GIT_USER_NAME')]){                
                        echo 'clonning with credentials'
                        sh 'git clone https://github.com/XerO00/cd.git'
                        // sh 'git push'
                        sh 'pwd'
                        sh 'ls'
                        sh 'sed "s/tagVersion/2.0/g" deployment.yaml.yml'
                        sh 'cat deployment.yaml'
                        echo 'git push successful'
                    }
                }                               
            }
        }
    }
}
