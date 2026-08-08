resource "aws_instance" "web" {
  ami           = "ami-002192a70217ac181"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "Terraform"
    project = "Roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = "TCP"
      cidr_blocks      = ingress.value.cidr_blocks
      description      = ingress.value.description 
    }
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = "allow_all"
  }
}