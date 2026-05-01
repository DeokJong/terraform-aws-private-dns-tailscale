resource "aws_route53_zone" "this" {
  name = var.domain_name

  vpc {
    vpc_id = var.vpc_id
  }

  comment = "Private DNS zone for ${var.domain_name}"
}

data "aws_vpc" "this" {
  id = var.vpc_id
}

resource "tailscale_dns_split_nameservers" "this" {
  domain      = var.domain_name
  nameservers = [cidrhost(data.aws_vpc.this.cidr_block, 2)]
}
