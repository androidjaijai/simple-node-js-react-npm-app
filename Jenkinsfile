pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000'
    }
    
  }
  stages {
    stage('Git Test') {
      steps {
        sh 'pwd'
        sh 'whoami'
        sh 'which node'
        sh 'node --version'
        sh 'which git'
        sh 'git --version'
        sh './jenkins/scripts/git.sh'
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
        sh './jenkins/scripts/kill.sh'
      }
    }
  }
  environment {
    CI = 'true'
  }
  post {
    always {
      mail(to: 'lm193hk.hkust@gmail.com', subject: "ALWAYS: ${currentBuild.fullDisplayName}", body: 'something changed. take a look man')
      
    }
    
  }
}