module "vpc" {
    source = "git::https://github.com/Umesh16082019/Terraform.git//Modules_VPC?ref=main"
    project = var.project
    environment = var.environment
    is_peering_required = true
}