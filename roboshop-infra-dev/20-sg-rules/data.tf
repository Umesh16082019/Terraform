# Fetch the public IPv4 address
data "http" "my_ip" {
  url = "https://ipv4.icanhazip.com"
}

# Output the IP address
output "current_ipv4" {
  value = chomp(data.http.my_ip.response_body)
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name            = "/${var.project}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name            = "/${var.project}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name            = "/${var.project}/${var.environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name            = "/${var.project}/${var.environment}/user_sg_id"
}