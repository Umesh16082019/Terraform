variable "instances_names" {
    type = list
    default = ["Mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "Payment", "frontend"]
}

variable "zone_id" {
    default = "Z03494033V1RA38KAHO6I"
}

variable "domain_name" {
    default = "kamalhaasan.store"
}

variable "fruits" {
    type = list(string)
    default = [ "apple", "banana", "apple", "orange"]
}

variable "fruits_set" {
    type = set(string)
    default = [ "apple", "banana", "apple", "orange"]
}