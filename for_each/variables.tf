/* variable "instances" {
   type= map
   default= {
   mongodb = "t3.small"
   catalogue = "t3.micro"
   mysql = "t3.small"
   cart = "t3.micro"
   }
} */

variable "instances" {
    type= list(string)
    default=  ["mongodb", "catalogue"]
}
variable "zone_id" {
    default = "Z03494033V1RA38KAHO6I"
}

variable "domain_name" {
    default = "kamalhaasan.store"
}