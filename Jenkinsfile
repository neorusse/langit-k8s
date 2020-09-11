pipeline {
    agent any

    stages {

        stage('Lint HTML Files') {
            steps {
                sh 'echo "STAGE 1: Checking app code for syntax error ..."'
                sh 'tidy -q -e app/templates/lintcheck.html'
            }
        }

        stage('Lint Dockerfile') {
            steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint app/Dockerfile | tee -a hadolint_lint.txt'
                            sh '''
                                lintErrors=$(stat --printf="%s"  hadolint_lint.txt)
                                if [ "$lintErrors" -gt "0" ]; then
                                    echo "Errors have been found, please see below"
                                    cat hadolint_lint.txt
                                    exit 1
                                else
                                    echo "There are no erros found on Dockerfile!!"
                                fi
                            '''
                    }
                }
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
    }
}
