module "ec2" {
    source = "../Modules_EC2"
    instance_type = var.instance_type
    ami_id = data.aws_ami.roboshop.id
    project = var.project_name
    environment = var.env
    sg_ids = var.sg_ids
    tags = {
        Name = "${var.project_name}-${var.env}-${var.component}"
        component = var.component
    }

}