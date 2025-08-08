# terraform import cloudflare_ruleset.default zones/ab6606e8b3aad0b66008eb26f2dd3660/cfe2f8797a314e5ba48192a7e7520bd0
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
resource "cloudflare_ruleset" "default" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_firewall_custom"
  zone_id = var.zone_id
  rules   = var.firewall_rules
}