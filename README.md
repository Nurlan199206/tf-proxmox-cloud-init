# tf-proxmox-cloud-init
## cloud-init terraform files

** Software version: **

```
Proxmox: 8.2.2
Telmate: 3.0.1-rc3
terraform: 1.9.2
```

```
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qm create 9000 --name ubuntu-cloud --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0 --ide2 local-lvm:cloudinit
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:30
qm importdisk 9000 /root/jammy-server-cloudimg-amd64.img local-lvm
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-1
qm set 9000 --boot c --bootdisk scsi0
qm template 9000
```

```
terraform init
terraform plan
terrform apply -auto-approve
```

