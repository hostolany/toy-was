pipeline {
    agent any 
    stages {
        stage('Image Build') { 
            steps {
            sh '''
            sudo docker build -t 192.168.0.91:5000/was:polar .
            '''
            }
        }
        stage('Image Push') { 
            steps {
            sh '''
            sudo docker push 192.168.0.91:5000/was:polar
            '''
            }
        }
        stage('Kuber Apply') { 
            steps {
            sh '''
            sudo kubectl apply -f was.yml
            '''    
            }
        }
    }
}
