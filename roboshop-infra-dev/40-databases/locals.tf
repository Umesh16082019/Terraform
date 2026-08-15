locals {
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    ami_id = "ami-0bdc7d025135d7b49"
    database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}