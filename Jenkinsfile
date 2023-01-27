pipeline {
    agent any 
    stages {
        stage('Delete') { 
            steps {
            sh '''
            sudo kubectl delete -f was.yml
            sudo kubectl delete -f web.yml
            '''
            }
        }
        stage('Image Build') { 
            steps {
            sh '''
            sudo docker build -t 192.168.0.91:5000/was .
            '''
            }
        }
        stage('Image Push') { 
            steps {
            sh '''
            sudo docker push 192.168.0.91:5000/was
            '''
            }
        }
        stage('Kuber Apply') { 
            steps {
            sh '''
            sudo kubectl apply -f was.yml
            sudo kubectl apply -f web.yml
            '''    
            }
        }
    }
}
