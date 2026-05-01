provider "aws" {}

provider "tailscale" {}

module "private_dns_tailscale" {
  source = "DeokJong/private-dns-tailscale/aws"

  domain_name = var.domain_name
  vpc_id      = var.vpc_id

  tags = {
    Environment = "example"
    ManagedBy   = "terraform"
  }
}
