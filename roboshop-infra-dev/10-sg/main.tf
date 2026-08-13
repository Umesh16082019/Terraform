module "sg" {
    source = "git::https://github.com/Umesh16082019/Terraform.git//Modules_SG?ref=main"
    project = var.project
    environment = var.environment
    sg_name="MongoDB"
    vpc_id=local.vpc_id
}