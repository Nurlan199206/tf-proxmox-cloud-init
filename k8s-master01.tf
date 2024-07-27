resource "proxmox_vm_qemu" "k8s-master-01" {
    name        = "k8s-master-01"
    desc        = "Ubuntu Server"
    vmid        = "101"
    target_node = "proxmox"
    cores       = 4
    sockets     = 1
    cpu         = "host"
    memory      = 4096
    bootdisk    = "scsi0"
    scsihw      = "virtio-scsi-pci"
    agent       = 1
    clone       = "ubuntu-cloud"
    full_clone  = "true"


disks {
scsi {
  scsi0 {
     disk {
        storage = "local-lvm"
        size = "25G"
      }
    }
  }
ide {
  ide2 {
     cloudinit {
        storage = "local-lvm"
      }
    }
  }
}




  os_type    = "cloud-init"
  ipconfig0  = "ip=192.168.1.161/24,gw=192.168.1.1"
  nameserver = "192.168.1.1"
  ciuser     = "nurlan"
  cipassword = "123"
  sshkeys = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkQN3ZiNFqalUyTagMCD4BxnflyXd+5+5QFlPay9locW4qt2YpxFgdzmwoJ0qkIKa959nv/qrvMX1HXmP9ZyxGAQUbGTWHGp3BaS+QTWGD84QAoyAo+k9yF+VqPqHZFYpj0eeT/gMY7JBR8KWe1TxErRgv0AP7mohraF8M7eP9R3C3RIGhG1A22C5NcRQ5FYvzO6WzJJndvg0QVvHcUtFkG3k6PjvJZJoWFCQ3JYYlNlFB3yejOnO/sd8iDa+NAPMs7V4bL3P9UQ2B4LMo3KVi0oYqkLay3GHhcptU4my4EYZ9Z+x2kcKgRLgsLvIkxjvOvnDfoiiBn7vYyr+sAy9KACZkn3safd6zfwreySC+YS4AWn3mTQXjrXgLJVn+Atqjg95v+Fm6aJXkpzrQoQF8GjmF2iMArikoMV/rvZ0cDdxDyKPw4oHHh/BTcTWhDJUpLJ0ibdmzlbiznkngj2YSJessmh1TpYkuyiVadIH8K8Cp/UHZGO87KQltvAcBmhXBJVE1H4AAc/vaFQLNImnzCi53cBsFQD05x3i9C2egSCQmOnSHbAwwTy8tpIseB5h+W1KCH2Pn4e47FhAHbTwQp6ym1NXrZsajvgdROxSJQHuO8NFy1+llGSDd2mfM/PO66fRFk1cOPkq9Q7sK+sD8IANOVKgElvow7LtJzzIJDw== nurlan@Nurlans-MacBook-Pro.local
  EOF
}

