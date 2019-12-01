provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

data "cloudflare_zones" "ghost_domain_zones" {
  filter {
    name   = var.cloudflare_domain
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "ghost_site_record" {
  zone_id = lookup(data.cloudflare_zones.ghost_domain_zones.zones[0], "id")
  type    = "A"
  name    = var.cloudflare_dns_record_name
  value   = data.digitalocean_droplet.ghost.ipv4_address
  ttl     = "1"
	proxied = var.cloudflare_dns_record_proxied
 }

resource "cloudflare_zone_settings_override" "ghost_zone_settings" {
  zone_id = lookup(data.cloudflare_zones.ghost_domain_zones.zones[0], "id")
    settings {
			always_use_https = "on"
    }
	}