variable "common_tags" {
    default= {
        Project = "Roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}

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