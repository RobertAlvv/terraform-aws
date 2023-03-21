pipeline {
  agent { label 'linux'}
  options {
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
        sh 'cd appserver'
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