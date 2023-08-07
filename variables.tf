variable "alb_dns_name" {
  type = string
}

variable "alb_zone" {
  type = string
}

variable "r53_alb_records" {
  type = list(string)
}

variable "r53_cdn_records" {
  type = list(string)
}

variable "cdn_dns_name" {
  type = string
  default = ""
}

variable "cdn_zone" {
  type = string
  default = ""
}

#variable "api_dns_name" {
#  type = string
#}
#
#variable "api_zone" {
#  type = string
#}

variable "alb_name" {
  type = string
}

#variable "dns_records" {
#  type = map(object({
#    domain_name = string
#    hosted_zone = string
#    domain_record = string
#  }))
#}

variable "hosted_zone_name" {
  type = string
}