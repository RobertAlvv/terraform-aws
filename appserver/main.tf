terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAZXHO6OHA4EBSOGWQ"
  secret_key = "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"
}

# Create a EC2
resource "aws_instance" "ubuntu" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  

  # Define las etiquetas para la instancia
  tags = {
    Name = "ExampleInstance"
  }

#   # Define la clave pública SSH para la instancia
#   key_name = "testpem"


#   connection {
#       type        = "ssh"
#       host        = self.public_ip
#       user        = "ubuntu"
#       private_key = file("E:\\AWS\\key-pair\\testpem.pem") 
#   }

    provisioner "remote-exec" {
    inline = [
         "sudo apt-get update",
        #  "sudo apt-get install -y ssh",
        #  "sudo apt install -y git",
        #  "sudo apt install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y",
        #  "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
        #  "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable' -y",
        #  "sudo apt update",
        #  "apt-cache policy docker-ce -y",
        #  "sudo apt install docker-ce -y",
        #  "sudo apt install openjdk-8-jdk -y",
        #  "sudo apt install openjdk-11-jdk -y",
        #  "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc &gt; /dev/null",
        #  "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list &gt; /dev/null",
        #  "sudo apt update",
        #  "sudo apt install jenkins -y",
        #  "sudo ufw allow 8080",
        #  "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
    ]
  }
}

# Crea un grupo de seguridad para permitir el acceso SSH
resource "aws_security_group" "instance" {


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


