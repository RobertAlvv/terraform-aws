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
        // sh './terraformw apply -auto-approve -no-color'
        sh "sudo terraform init"
        sh "sudo terraform plan"
        sh "sudo terraform apply"
        

      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}