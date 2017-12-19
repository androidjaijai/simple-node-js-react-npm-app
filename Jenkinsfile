def notifyStarted() {
  mail to: "lm193hk.hkust@gmail.com", subject:"notifyStarted(): ${currentBuild.fullDisplayName}", body: "see it works!"
}

// notifyStarted()

pipeline {

    agent none
    // agent {
    //     docker {
    //         image 'node:6-alpine'
    //         args '-p 3000:3000'
    //     }
    // }

    // environment {
    //     CI = 'true'
    // }
    // post {
    //     changed {
    //       mail to: "lm193hk.hkust@gmail.com", subject:"CHANGED: ${currentBuild.fullDisplayName}", body: "something changed. take a look man"
    //     }
    //     success {
    //       mail to: "lm193hk.hkust@gmail.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we passed."
    //     }
    //     failure {
    //       mail to: "lm193hk.hkust@gmail.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
    //     }
    //     always {
    //         mail to: "lm193hk.hkust@gmail.com", subject:"ALWAYS: ${currentBuild.fullDisplayName}", body: "something changed. take a look man"
    //     }
    // }
    stages {
        /*
        stage('Notify') {
            steps{
                mail to: "lm193hk.hkust@gmail.com", subject:"BEGIN: ${currentBuild.fullDisplayName}", body: "test just began"
            }
        }
        */
        stage('Git Test') {
            steps{
                // sh 'pwd'
                // sh 'ls -al'
                // sh 'whoami'
                // sh 'which node'
                // sh 'node --version'
                // sh 'ls -al /usr/bin/'
                // sh 'ls -al /usr/local/bin/'
                // sh 'which apk'
                sh 'apk add --no-cache bash git'
                // sh 'which git'
                sh 'git ls-remote'
                sh 'git branch -D master'
                sh 'git checkout --orphan master'
                sh 'git pull --all'
                sh 'git checkout master'
                sh 'git pull'
                sh 'git status'
                sh 'git log'
                sh 'git checkout develop'
                sh 'git status'
                sh 'git log'
                // sh 'git branch master'
                // sh 'git branch -u remote/origin/master master'
                sh 'cat .git/config'
                sh 'git --version'
                // sh 'git pull origin/master'
                // sh 'git branch -r | grep -v "\\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'
                sh 'git branch --all'
                // sh 'git fetch --all'
                // sh 'git diff --stat remotes/origin/master remotes/origin/master'
                // sh 'git log origin/master'
                sh 'git diff --stat develop master -- app/config.js'
                sh 'git diff --stat origin/develop origin/master -- app/config.js'
            }
        }
        stage('Fail') {
            steps {
                sh './jenkins/scripts/fail.sh'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                // input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
