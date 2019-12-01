output "digitalocean_droplet_ip" {
  value = data.digitalocean_droplet.ghost.ipv4_address
  description = "Your droplet ip address."
  depends_on = [cloudflare_record.ghost_site_record]
}
