terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = "https://192.168.1.193:8006/api2/json"
  pm_password     = var.proxmox
  pm_user         = "terraform-lab@pve"
}
