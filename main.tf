resource "proxmox_vm_qemu" "test_vm" {
  vmid             = 201
  name             = "test-vm-from-tf"
  target_node      = "pve"

  kvm = false

  cpu {
    cores          = 2
    type    = "kvm64"
  }
  agent            = 1
  boot             = "order=scsi0"
  clone            = "ubuntu-22-04-cloudinit"
  full_clone       = true
  memory           = 2048
  scsihw           = "virtio-scsi-single"
  vm_state         = "running"
  automatic_reboot = true

  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=dhcp"
  skip_ipv6  = true
  ciuser     = "ubuntu"  # Стандартный пользователь для Ubuntu cloud images
  cipassword = ""
  #sshkeys    = var.ssh_key

  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "20G"
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

  network {
    id     = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
