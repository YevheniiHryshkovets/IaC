provider "aws" {
  # region = "eu-north-1"
}

resource "aws_default_vpc" "default" {}

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

resource "aws_instance" "webserver-test" {
  # ami                    = "ami-0fe8bec493a81c7da" # Ubuntu 20
  ami                    = "ami-0c7217cdde317cfec"   # Ubuntu 22
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.webserver-test.id]
  key_name               = "0712mac"
  # user_data              = data.template_file.init.rendered
  user_data = file("./setup_docker.sh")
  tags = {
    Name  = "Web Server"
    Owner = "Admin"
  }
}


resource "aws_security_group" "webserver-test" {
  name        = "WebServer Security Group 3"
  description = "My First SecurityGroup"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
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

output "webserver_ip" {
  value = aws_instance.webserver-test.public_ip
}