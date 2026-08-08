data "aws_ami" "example" {
  most_recent      = true
  owners           = ["125523088429"]

  filter {
    name   = "name"
    values = ["Fedora-Cloud-Base-AmazonEC2.aarch64-Rawhide-20260120.0"]
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
