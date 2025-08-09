terraform {
  required_providers {
    uptimerobot = {
      source  = "uptimerobot/uptimerobot"
      version = "~> 1.1.0"
    }
  }
}

provider "uptimerobot" {
  api_key = var.uptimerobot_api_key
  # api_url = "https://api.uptimerobot.com/v3" # Optional: Custom API endpoint
}


resource "uptimerobot_monitor" "default_monitor" {
  
  for_each = var.monitors
  name     = each.key
  type     = each.value.type
  url      = each.value.url
  interval = each.value.interval

  # Optional: SSL certificate expiration monitoring
  # Optional: Follow HTTP redirects
  follow_redirections = each.value.follow_redirections

  # Optional: Custom timeout (default is 30 seconds)
  timeout = each.value.timeout
  # Optional: Tags for organization
  tags = each.value.tags
}