variable "domain_name" {
  description = "Private DNS domain name."
  type        = string
  default     = "internal.example.com"
}

variable "vpc_id" {
  description = "VPC ID to associate with the Route 53 private hosted zone."
  type        = string
}
