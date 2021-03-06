pipeline {
    agent any

    stages {

        stage('Lint HTML Files') {
            steps {
                sh 'echo "STAGE 1: Checking app code for syntax error ..."'
                sh 'tidy -q -e app/templates/lintcheck.html'
            }
        }

        stage( 'Build Flask App and Nginx Reverse Proxy Docker Image and Deploy to Docker Registry' ) {
            steps {
                sh "docker version"
                sh 'echo Containerizing Flask Application and Nginx Reverse Proxy Server'
                sh 'docker build -t ecoden/langitstars-k8s:v0.95 -f ./app/Dockerfile ./app'
                sh 'docker build -t ecoden/nginxproxy:v1.0 -f ./nginx/Dockerfile ./nginx'
                sh 'docker image ls'
                withDockerRegistry([url: '', credentialsId: 'Docker-Hub-Registry']) {
                // sh 'docker tag nginxproxy:v1.0 ecoden/nginxproxy:v1.0'
                // sh 'docker tag langitstars-k8s:v0.95 ecoden/langitstars-k8s:v0.95'
                sh 'docker push ecoden/nginxproxy:v1.0'
                sh 'docker push ecoden/langitstars-k8s:v0.95'
                }
            }
        }

        stage('Deploying to AWS EKS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS-EKS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh "aws eks --region us-east-2 update-kubeconfig --name longitstars-k8s"
                    sh 'kubectl apply -f k8s-manifest.yml'
                }     
            }
        }
    }
}
