pipeline {
    agent any

    stages {

        stage('Lint HTML Files') {
            steps {
                sh 'echo "STAGE 1: Checking app code for syntax error ..."'
                sh 'tidy -q -e app/templates/lintcheck.html'
            }
        }

        stage( 'Build Flask App Docker Image' ) {
            steps {
                sh "docker version"
                sh 'echo Containerizing Flask Application'
                sh 'docker build -t ecoden/langitstars-k8s:v0.95 -f ./app/Dockerfile ./app'
                sh 'docker image ls'
            }
        }

        stage( 'Build Nginx Reverse Proxy Docker Image' ) {
            steps {
                sh "docker version"
                sh 'echo Containerizing Nginx Reverse Proxy Server'
                sh 'docker build -t ecoden/nginxproxy:v1.0 -f ./nginx/Dockerfile ./nginx'
                sh 'docker image ls'
            }
        }

        stage( 'Push Flask App & Nginx Image to Docker Repository' ) {
            steps {
                withDockerRegistry([url: '', credentialsId: 'docker-hub-repository']) {
                    sh 'echo Uploading Flask App & Nginx Image to dockerhub Repository'
                    sh 'docker push ecoden/langitstars-k8s:v0.95'
                    sh 'docker push ecoden/nginxproxy:v1.0'
                }
            }
        }
    }
}
