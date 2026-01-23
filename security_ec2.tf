resource "aws_security_group" "web_sg" {
  vpc_id      = aws_vpc.main.id
  name        = "${var.project_name}-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "web" {
  ami                    = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.public[0].id
  vpc_security_group_ids  = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install git -y
              yum install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = { Name = "${var.project_name}-ec2" }
}
