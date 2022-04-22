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
                    sh(script: """
                    rm -rf cd
                    git clone https://github.com/XerO00/cd.git
                    cd cd/
                    ls
                    sed "s/tagVersion/2.0/g" deployment.yaml  > deployment.yaml
                    cat deployment.yaml
                    git add .
                    git commit -m 'tag changed'
                    git status
                                     
                    """)
                    echo 'git push successful'                    
                }                               
            }
        }
    }
}
