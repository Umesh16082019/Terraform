variable "name" {
    type = string
    default = "locals"
}

variable "environment" {
    type = string
    default = "dev"
}

/* variable "instance_name" {
    type = string
    default = "${var.name}-${var.environment}"
} */


variable "ec2_tags" {
    default = {
        Name = "Terraform_instance"
        Environment = "prod"
    }
}

variable "sg_tags" {
    default = {
        Name = "Terraform_sg"
        Environment = "QA"
    }
}