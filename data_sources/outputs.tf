output "ami_id" {
    value= data.aws_ami.example.id
}

output "instance_id" {
    value= data.aws_instance.Terraform_instance.id
}