resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.mongodb_sg_id]
  user_data = file("${path.module}/bootstrap.sh")
  tags = merge(
    {
        Name = "${var.project}-${var.environment}-mongodb"
    },
    local.common_tags
  )
}

/* resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  # --- CHANGE THE CONNECTION BLOCK TO THIS ---
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("Umesh.pem")  # <--- MUST use the key, not the password
    host        = aws_instance.mongodb.private_ip
    timeout     = "5m"                 # Give it enough time to boot up
  }
  # -------------------------------------------

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh" 
    ]
  }
} */