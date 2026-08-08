resource "aws_instance" "web" {
  ami           = "ami-002192a70217ac181"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "Roboshop-${var.environment}"
    project = "Roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all-${var.environment}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = "allow_all-${var.environment}"
  }
}