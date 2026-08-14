variable "project" {
    default = "Roboshop"
}

variable "environment" {
    default = "dev"
}

variable "private_key_pem" {
  description = "The content of the SSH private key"
  type        = string
  sensitive   = true
}