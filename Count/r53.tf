resource "aws_route53_record" "www" {
  count = 10
  zone_id = var.zone_id
  # interpolation
  name    = "${var.instances_names[count.index]}.${var.domain_name}" # Mongodb.kamalhaasan.store
  type    = "A"
  ttl     = 1
  records = [aws_instance.web[count.index].private_ip]
}

#creating a Roboshop.kamalhaasan.store using functions

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  # interpolation
  name    = "Roboshop.${var.domain_name}" # Roboshop.kamalhaasan.store
  type    = "A"
  ttl     = 1
  records = [aws_instance.web[index(var.instances_names, "frontend")].public_ip]
}