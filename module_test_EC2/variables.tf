variable "project_name" {
    default = "Roboshop"
}

variable "env" {
    default = "dev"
}

variable "instance_type" {
    default = "t3.small"
}

variable "sg_ids" {
    default = ["sg-0a1041abc3d14180f"]
}

variable "component" {
    default = "catalogue"
}
