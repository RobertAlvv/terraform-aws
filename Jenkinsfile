pipeline {
  agent any

  environment {
    TERRAFORM_VERSION = "1.3.0" // la versión de Terraform que deseas utilizar
    TERRAFORM_DIR = "${env.WORKSPACE}/terraform" // la ruta del directorio de trabajo de Terraform
  }

  stages {

  

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    //  stage('Build') {
    //   steps {
    //     sh 'echo "" | sudo su -S'
    //   }
    // }

    stage('deploy') {
      environment {
        HOME = "${env.WORKSPACE}"
        PATH = "/usr/local/bin:${env.PATH}"
      }
      steps { 
        // sh "sudo su apt-get update"
        // sh "sudo apt-get install -y unzip"
        // sh "curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
        // sh "unzip terraform_${TERRAFORM_VERSION}_linux_a    md64.zip -d ${env.WORKSPACE}"
        sh "cd ${TERRAFORM_DIR} && ./terraform init"
      }
    }

    stage('Terraform Apply') {
      environment {
        HOME = "${env.WORKSPACE}"
        PATH = "/usr/local/bin:${env.PATH}"
      }
      steps {
        sh "cd ${TERRAFORM_DIR} && ./terraform apply -auto-approve"
      }
    }
  }
}