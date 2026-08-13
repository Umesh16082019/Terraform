variable "project" {
    default = "Roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = list(string)
    default = [
        # Databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # Backend
        "catalogue", "user", "cart", "shipping", "payment",
        # Backend ALB
        "backend_alb",
        # Frontend
        "frontend",
        # Frontend ALB
        "frontend_alb",
        # Bastion
        "bastion"
    ]
}