variable "project" {
    default = "Roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = String
    default = {
        # Databases
        "MongoDB", "Redis", "Mysql", "RabbitMQ",
        # Backend
        "Catalogue", "User", "Cart", "Shipping", "Payment",
        # Backend ALB
        "Backend_alb"
        # Frontend
        "Frontend",
        # Frontend ALB
        "Frontend_alb",
        # Bastion
        "Bastion"
    }
}