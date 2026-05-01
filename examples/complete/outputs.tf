output "zone_id" {
  description = "Route 53 private hosted zone ID."
  value       = module.private_dns_tailscale.zone_id
}

output "split_dns_nameservers" {
  description = "Tailscale split DNS nameservers configured for the domain."
  value       = module.private_dns_tailscale.split_dns_nameservers
}
