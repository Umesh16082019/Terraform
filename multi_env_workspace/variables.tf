variable "project" {
    default = "Roboshop"
}

variable "instance_type" {
    default = {
        dev = "t3.micro"
        uat = "t3.micro"
        prod = "t3.small"
    }
}