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
<<<<<<< Updated upstream
    stage('Build') {
      steps {
        sh 'npm install'
      }
=======
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
                sh 'pwd'
                sh 'whoami'
                sh 'which node'
                sh 'node --version'
                sh 'ls -al /usr/bin/'
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
                // input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
>>>>>>> Stashed changes
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