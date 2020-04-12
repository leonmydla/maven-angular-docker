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
                sh 'docker build --no-cache -t leonmydla/maven-angular:latest .'
            }
        }
        stage('Push to registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_leonmydla', passwordVariable: 'dockerpassword', usernameVariable: 'dockeruser')]) {
                    sh 'docker login -u ${dockeruser} -p ${dockerpassword}'
                }

                sh 'docker push leonmydla/maven-angular:latest'
                sh 'docker logout'
            }

            when {
                branch 'master'
            }
        }
    }
}
