variable "dns_records" {
  description = "List of dns records"
  type = map(object({
    type    = string
    content = optional(string)
    proxied = optional(bool, true)
    ttl     = optional(number, 300)
  }))
}
variable "zone_id" {
  type        = string
  description = "Your Zone ID"
}
variable "share_comment" {
  type        = string
  description = "Your comment"
  default     = "Managed by Terraform"
}


variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API token"
  sensitive   = true
}
variable "ddns_content" {
  type        = string
  description = "The content of the DDNS record"
  sensitive   = true
}