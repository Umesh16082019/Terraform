resource "aws_instance" "web" {
  ami           = "ami-002192a70217ac181"
  instance_type = "t3.micro"
  key_name      = "Umesh"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }

  provisioner "local-exec" {
    command = "exit-1"
    on_failure = continue
  }

 provisioner "local-exec" {
    command = "echo script-2"
  }

   provisioner "local-exec" {
    when = destroy
    command = "echo 'Deleting the instance'"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo  > inventory.ini"
  }
  tags = {
    Name = "Terraform-provisioner"
    project = "Roboshop"
  }

  connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("C:/Users/umesh/Downloads/Umesh (1).pem")
  host        = self.public_ip
}

   provisioner "remote-exec" {
    inline = [
      "sudo dnf update -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all"
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