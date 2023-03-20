pipeline {
  agent { label 'linux'}
  options {
    ansiColor('xterm')
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
      }
    }


    
    stage('terraform') {
      steps {
        sh './terraformw apply -auto-approve -no-color'
        // sh "terraform init"
        // sh "terraform plan"
        // sh "terraform apply"
        

      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}