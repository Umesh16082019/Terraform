resource "aws_instance" "web" {
  #for_each = var.instances
  for_each= toset(var.instances)
  ami           = "ami-002192a70217ac181"
  #instance_type = "each.value"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
  tags = {
    Name = each.key
    Project = "Roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_roboshop"
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
    Name = "allow_all"
  }
}
  