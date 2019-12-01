provider "digitalocean" {
  token = var.digitalocean_token
}

data "digitalocean_ssh_key" "ghost_ssh_key" {
  name = var.digitalocean_ssh_key
}

resource "digitalocean_droplet" "ghost" {
  image  = var.digitalocean_droplet_image
  name   = var.digitalocean_droplet_name
  region = var.digitalocean_droplet_region
  size   = var.digitalocean_droplet_size
  ssh_keys = [data.digitalocean_ssh_key.ghost_ssh_key.id]
  backups = var.digitalocean_droplet_backup
}

data "digitalocean_droplet" "ghost" {
  name = var.digitalocean_droplet_name
  depends_on = [digitalocean_droplet.ghost]
}
