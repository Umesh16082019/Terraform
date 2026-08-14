data "aws_ami" "roboshop" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    # This searches for Amazon Linux 2023 AMIs
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name            = "/${var.project}/${var.environment}/database_subnet_ids"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name            = "/${var.project}/${var.environment}/mongodb_sg_id"
}
