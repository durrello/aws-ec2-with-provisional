# Look up the latest Amazon Linux 2 AMI
data "aws_ami" "ami1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_iam_group" "group2" {
  name = "DevOps2"
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "name" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  depends_on = [aws_key_pair.ec2_key, aws_iam_group.group2]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo hello"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "mkdir testfolder",
      "pwd",
      "nproc"
    ]
  }

  provisioner "file" {
    source      = var.private_key_path
    destination = "/tmp/w.pem"
  }
}

variable "key_name" {
  type        = string
  description = "Name for the EC2 key pair"
  default     = "provisioner-demo-key"
}

variable "public_key" {
  type        = string
  description = "SSH public key material for the key pair (e.g. contents of ~/.ssh/id_rsa.pub)"
}

variable "private_key_path" {
  type        = string
  description = "Local path to the matching private key (.pem). Never commit this file."
  default     = "key.pem"
}
