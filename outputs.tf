output "zone_id" {
  description = "Route 53 private hosted zone ID."
  value       = aws_route53_zone.this.zone_id
}

output "zone_name" {
  description = "Route 53 private hosted zone name."
  value       = aws_route53_zone.this.name
}

output "name_servers" {
  description = "Route 53 private hosted zone name servers."
  value       = aws_route53_zone.this.name_servers
}

output "split_dns_domain" {
  description = "Tailscale split DNS domain."
  value       = tailscale_dns_split_nameservers.this.domain
}

output "split_dns_nameservers" {
  description = "Tailscale split DNS nameservers configured for the domain."
  value       = tailscale_dns_split_nameservers.this.nameservers
}
