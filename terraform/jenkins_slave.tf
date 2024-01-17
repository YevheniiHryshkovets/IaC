provider "aws" {
    alias = "jenkins"
  # region = "eu-north-1"
}

resource "aws_default_vpc" "jenkins-slave-default-vpc" {}

# data "template_file" "init" {
#   template = file("template/setup.tpl")
#   vars = {
#     jdk_pkg = "openjdk-11-jdk"
#   }
# }

# provisioner "file" {
#   source      = "conf/proxy.conf"
#   destination = "/etc/apache2/mods-enabled/proxy.conf"
# }

resource "aws_instance" "jenkins-slave-server" {
  # ami                    = "ami-0fe8bec493a81c7da" # Ubuntu 20
  ami                    = "ami-0c7217cdde317cfec"   # Ubuntu 22
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.jenkins-slave-server.id]
  key_name               = "0712mac"
  # user_data              = data.template_file.init.rendered
  user_data = file("./configs/jenkins_slave_setup.sh")
  tags = {
    Name  = "Jenkins_slave"
    Owner = "Admin"
  }
}


resource "aws_security_group" "jenkins-slave-server" {
  name        = "Jenkins_slave Security Group"
  description = "jenkins_slave security group"
  vpc_id      = aws_default_vpc.jenkins-slave-default-vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web"
    Owner = "Admin"
  }

}

output "jenkins_slave_ip" {
  value = aws_instance.jenkins-slave-server.public_ip
}