locals {
    ami_id = data.aws_ami.example.id
    environment = terraform.workspace
}