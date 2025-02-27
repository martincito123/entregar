variable "ami" {
  type        = string
  description = "Application Image to Deploy"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "appname" {
  type        = string
  description = "Application Name"
}

provider "aws" {
  region = var.region
}

resource "aws_security_group" "allow_clumsy_bird" {
  name        = "allow_clumsy_bird"
  description = "Allow inbound traffic to clumsy bird 8001"

  ingress {
    description = "Clumsy Bird Inbound Traffic"
    from_port   = 8001
    to_port     = 8001
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
    Name = "allow_clumsy_bird"
  }
}


resource "aws_instance" "test_ami" {
  ami                    = var.ami
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_clumsy_bird.id]

  tags = {
    "Name" = var.appname
  }

}

output "public_ip" {
  value = aws_instance.test_ami.public_ip
}

output "public_dns" {
  value = aws_instance.test_ami.public_dns
}

output "clumsy_bird" {
  value = "http://${aws_instance.test_ami.public_dns}:8001"
}