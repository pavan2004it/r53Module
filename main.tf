data "aws_route53_zone" "ringgitpay" {
  name = "dev.ringgitpay-sandbox.com"
}

data "aws_alb" "rp-alb" {
  name = var.alb_name
}

resource "aws_route53_record" "rp-dev-alb" {
  for_each = toset(var.r53_alb_records)
  zone_id = data.aws_route53_zone.ringgitpay.id
  name    = each.value
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "rp-cdn" {
  for_each = toset(var.r53_cdn_records)
  zone_id = data.aws_route53_zone.ringgitpay.id
  name    = each.value
  type    = "A"

  alias {
    name                   = var.cdn_dns_name
    zone_id                = var.cdn_zone
    evaluate_target_health = true
  }
}

#resource "aws_route53_record" "rp-apigwy" {
#  for_each = var.dns_records
#  zone_id = data.aws_route53_zone.ringgitpay.id
#  name    = each.value.domain_record
#  type    = "A"
#
#  alias {
#    name                   = each.value.domain_name
#    zone_id                = each.value.hosted_zone
#    evaluate_target_health = true
#  }
#}