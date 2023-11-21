# main.tf

provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Change this to your desired AMI
  instance_type = "t2.micro"

  tags = {
    Name = "test"
  }

  # Remote Provisioning (UserData)
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /tmp/hello.txt
              EOF

  # Local Provisioning (Provisioner)
  provisioner "local-exec" {
    command = "echo 'Instance Public IP: ${aws_instance.example.public_ip}'"
  }
}
