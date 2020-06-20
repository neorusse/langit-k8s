pipeline {
    agent any

    stages {

        stage('Lint HTML Files') {
            steps {
                sh 'echo "STAGE 1: Checking app code for syntax error ..."'
                sh 'tidy -q -e app/templates/lintcheck.html'
            }
        }

        stage('Docker Security Scan') {
              steps {
                 aquaMicroscanner imageName: 'ecoden/nginxproxy', notCompleted: 'exit 1', onDisallowed: 'fail'
              }
         }
    }
}
