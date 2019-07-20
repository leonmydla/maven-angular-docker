pipeline {
    agent {
        docker {
            label 'highUplink'
            image 'docker:latest'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build --no-cache -t lmydla/maven-angular:latest .'
            }
        }
        stage('Push to registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_lmydla', passwordVariable: 'dockerpassword', usernameVariable: 'dockeruser')]) {
                    sh 'docker login -u ${dockeruser} -p ${dockerpassword}'
                }

                sh 'docker push lmydla/maven-angular:latest'
                sh 'docker logout'
            }
        }
    }
}
