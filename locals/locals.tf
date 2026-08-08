locals {
    instance_type = "t3.micro"
    common_tags = {
        Project = "Roboshop"
        Terraform = "true"
        Environment = "dev"
    }
    ec2_final_tags = merge(local.common_tags, var.ec2_tags)
    ami_id = data.aws_ami.example.id
    instance_name = "${var.name}-${var.environment}"
}

