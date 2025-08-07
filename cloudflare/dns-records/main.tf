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

resource "cloudflare_dns_record" "default_load" {
  for_each = var.dns_records
  zone_id  = var.zone_id
  comment  = var.share_comment
  name     = each.key
  proxied  = each.value.proxied
  ttl      = each.value.proxied ? 1 : each.value.content
  type     = each.value.type 
  content  = each.value.type == "CNAME" ? var.ddns_content : each.value.content
}