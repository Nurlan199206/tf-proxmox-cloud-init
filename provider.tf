terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://192.168.1.75:8006/api2/json"
    pm_api_token_id = "root@pam!terraform"
    pm_api_token_secret = "cdd3f2b4-124e-4660-8c80-5b8defd5a7d6"
}
