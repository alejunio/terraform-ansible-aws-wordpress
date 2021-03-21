##############################################################################
# Gerenciamento de DNS
##############################################################################

# Apontamento DNS - Dominio App
resource "aws_route53_record" "a" {
  #zone_id = var.zone-domain
  zone_id = var.zone_dns
  name    = var.dns_domain
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web.public_ip]
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_dns
#  zone_id = var.zone-domain
  name    = "www"
  type    = "CNAME"
  ttl     = "300"
  records = [var.dns_domain]
}