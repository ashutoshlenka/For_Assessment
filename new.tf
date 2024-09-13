# Provider configuration
provider "aws" {
  region = "us-east-1"
}

# Key pair for SSH access
resource "aws_key_pair" "deployer_key" {
  key_name   = "new-unique-key-name"  # Use a unique name here
  public_key = file("/home/ubuntu/.ssh/id_rsa.pub")
}

# Security Group for allowing SSH
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instances for Different Environments
resource "aws_instance" "dev_instance" {
  ami             = "ami-0e86e20dae9224db8" # Use the appropriate AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer_key.key_name  # Reference new key pair
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Development-Server"
  }
}

resource "aws_instance" "qa_instance" {
  ami             = "ami-0e86e20dae9224db8"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer_key.key_name  # Reference new key pair
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "QA-Server"
  }
}

resource "aws_instance" "uat_instance" {
  ami             = "ami-0e86e20dae9224db8"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer_key.key_name  # Reference new key pair
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "UAT-Server"
  }
}

resource "aws_instance" "prod_instance" {
  ami             = "ami-0e86e20dae9224db8"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer_key.key_name  # Reference new key pair
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Production-Server"
  }
}

# Output the public IP addresses of the instances
output "dev_instance_ip" {
  value = aws_instance.dev_instance.public_ip
}

output "qa_instance_ip" {
  value = aws_instance.qa_instance.public_ip
}

output "uat_instance_ip" {
  value = aws_instance.uat_instance.public_ip
}

output "prod_instance_ip" {
  value = aws_instance.prod_instance.public_ip
}

