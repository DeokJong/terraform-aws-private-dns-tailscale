# terraform-aws-private-dns-tailscale

Terraform module that creates an AWS Route 53 private hosted zone and configures Tailscale split DNS for the same domain.

The split DNS nameserver is derived from the VPC CIDR block using `cidrhost(vpc_cidr, 2)`, which is the AmazonProvidedDNS resolver address for a VPC.

## Usage

```hcl
module "private_dns_tailscale" {
  source = "DeokJong/private-dns-tailscale/aws"

  domain_name = "internal.example.com"
  vpc_id      = "vpc-0123456789abcdef0"

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}
```

See [examples/complete](./examples/complete) for a complete example.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| aws | >= 5.0 |
| tailscale | >= 0.16.0 |

## Providers

| Name | Source |
|------|--------|
| aws | hashicorp/aws |
| tailscale | tailscale/tailscale |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain_name | Private DNS domain name to create in Route 53 and configure in Tailscale split DNS. | `string` | n/a | yes |
| vpc_id | VPC ID to associate with the Route 53 private hosted zone. | `string` | n/a | yes |
| comment | Comment for the Route 53 private hosted zone. | `string` | `null` | no |
| tags | Tags to apply to the Route 53 private hosted zone. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| zone_id | Route 53 private hosted zone ID. |
| zone_name | Route 53 private hosted zone name. |
| name_servers | Route 53 private hosted zone name servers. |
| split_dns_domain | Tailscale split DNS domain. |
| split_dns_nameservers | Tailscale split DNS nameservers configured for the domain. |
