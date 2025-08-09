variable "uptimerobot_api_key" {
  description = "UptimeRobot API key"
  type        = string
  sensitive   = true
}

variable "monitors" {
  description = "Configuration for UptimeRobot monitors"
  type = map(object({
    type = string
    url = string
    interval = optional(number, 300)
    follow_redirections = optional(bool, true)
    timeout = optional(number, 10)
    http_method_type = optional(string,"HEAD")
    tags = list(string)
  }))
}