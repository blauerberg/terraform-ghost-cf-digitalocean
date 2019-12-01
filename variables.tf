// digitalocean
variable "digitalocean_token" {
  type = string
}

// @see: https://marketplace.digitalocean.com/apps/ghost
variable "digitalocean_droplet_image" {
  type = string
  default = "ghost-18-04"
}

variable "digitalocean_droplet_name" {
  type = string
  default = "ghost-18-04"
}

// @see: https://developers.digitalocean.com/documentation/v2/#regions
variable "digitalocean_droplet_region" {
  type = string
  default = "sgp1"
}

// @see: https://developers.digitalocean.com/documentation/v2/#sizes
variable "digitalocean_droplet_size" {
  type = string
  default = "s-1vcpu-1gb"
}

variable "digitalocean_ssh_key" {
  type = string
}

variable "digitalocean_droplet_backup" {
  type = bool
  default = false
}

// cloudflare
variable "cloudflare_email" {
  type = string
}

variable "cloudflare_api_key" {
  type = string
}

variable "cloudflare_domain" {
  type = string
}

variable "cloudflare_dns_record_name" {
  type = string
  default = "@"
}

variable "cloudflare_dns_record_proxied" {
  type = bool
  default = true
}