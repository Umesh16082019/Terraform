resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = var.zone_id
  # interpolation
  name    = "${each.key}.${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

#creating a Roboshop.kamalhaasan.store using functions

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  # interpolation
  name    = "Roboshop.${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = lookup(aws_instance.web, "frontend").public_ip
  allow_overwrite = true
}