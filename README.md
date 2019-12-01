# terraform-ghost-cf-digitalocean

A simple terraform configuration for [Ghost](https://ghost.org/) with Digitalocean and Cloudflare.

## How to use

1. Download and setup credentials.
```
$ git clone https://github.com/blauerberg/terraform-ghost-cf-digitalocean.git
$ cd terraform-ghost-cf-digitalocean
$ cp terraform.tfvars.example terraform.tfvars

# set your token of DigitalOcean
$ sed -i -e "s/YOUR_DIGITALOCEAN_TOKEN/{your digitalocean token}/" terraform.tfvars

# set your ssh key name of DigitalOcean
$ sed -i -e "s/YOUR_DIGITALOCEAN_SSH_KEY/{your digitalocean ssh key name}/" terraform.tfvars

# set your cloudflare email address
$ sed -i -e "s/YOUR_CLOUDFLARE_EMAIL/{your cloudflare email address}/" terraform.tfvars

# set your cloudflare api key 
$ sed -i -e "s/YOUR_CLOUDFLARE_API_KEY/{your cloudflare api key}/" terraform.tfvars

# set your cloudflare domain
$ sed -i -e "s/YOUR_CLOUDFLARE_DOMAIN/{your cloudflare domain}/" terraform.tfvars
```

2. Apply terraform configuration.
```
$ terraform init
$ terraform plan
$ rerraform apply
```

3. After a minutes, you will show the external ip of droplet you've created by terraform. Last step, let's login your droplet and setup your Ghost!
```
ssh root@{your droplet ip}
```

4. Enjoy!

## Configurations

Available variables is below. You can override all values via `terraform.tfvars`.

| variable | description | default |
| :--- | :--- | :--- |
| `digitalocean_token` | token of digitalocean | none |
| `digitalocean_droplet_image` | image name of droplet | `ghost-18-04` |
| `digitalocean_droplet_name` | droplet name | `ghost-18-04` |
| `digitalocean_droplet_region` | region | `sgp01` |
| `digitalocean_droplet_size` | instance type of droplet | `s-1vcpu-1gb` |
| `digitalocean_ssh_key` | ssh key name of digitalocean | none |
| `digitalocean_droplet_backup` | whether if enable backup for droplet | `false` |
| `cloudflare_email` | email address of cloudflare | none |
| `cloudflare_api_key` | api key of cloudflare | none |
| `cloudflare_domain` | domain of cloudflare | none |
| `cloudflare_dns_record_name` | record name for ghost | `@` |
| `cloudflare_dns_record_proxied` | whether if enable proxy feature | `true` |
