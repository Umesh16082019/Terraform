terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.54.0" # Terraform AWS provider version
    }
  }
  backend "s3" {
    bucket = "remote-state-dev"
    key = "roboshop-dev-vpc"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}