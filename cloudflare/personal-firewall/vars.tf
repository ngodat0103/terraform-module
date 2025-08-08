variable "firewall_rules" {
  description = "List of firewall rules for Cloudflare"
  type = list(object({
    description = string
    expression  = string
    enable      = optional(bool, true)
    enabled     = optional(bool, true)
    action      = string
    action_parameters = optional(object({
      ruleset = optional(string)
    }), {})
    logging = optional(object({
      enabled = bool
    }))
  }))
}
variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API token"
  sensitive   = true
}
variable "zone_id" {
  type = string
}