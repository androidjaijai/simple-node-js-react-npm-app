pipeline {

    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }

    environment {
        CI = 'false'
    }

    post {
        always {
            mail to: "lm193hk.hkust@gmail.com", subject:"FINISHED: ${currentBuild.fullDisplayName}", body: "Test between   ${GIT_COMMIT}   and   ${GIT_PREVIOUS_COMMIT}   just finished."
        }
    }

    stages {
        stage('Notify') {
            steps{
                mail to: "lm193hk.hkust@gmail.com", subject:"BEGIN: ${currentBuild.fullDisplayName}", body: "Test between   ${GIT_COMMIT}   and   ${GIT_PREVIOUS_COMMIT}   just began."
            }
        }
        stage('Install Software') {
            steps {
                sh 'apk add --no-cache bash git'
            }
        }
        stage('App Config Check') {
            steps{
                sh 'printenv'
                sh 'echo $GIT_COMMIT'
                sh 'echo $GIT_PREVIOUS_COMMIT'
                script {
                    IS_APP_CONFIG_CHANGED = sh(
                        script: 'bash jenkins/scripts/git.sh',
                        returnStdout: true
                    ).trim()
                    echo "${IS_APP_CONFIG_CHANGED}"
                    if (IS_APP_CONFIG_CHANGED.equals("same")) {
                        echo "SAME"
                    } else {
                        echo "CHANGED"
                        mail to: "lm193hk.hkust@gmail.com", subject:"Change to App Config Detected: ${currentBuild.fullDisplayName}", body: "Between   ${GIT_COMMIT}   and   ${GIT_PREVIOUS_COMMIT}"
                    }
                }
            }
        }
    }
}
