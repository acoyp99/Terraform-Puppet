
resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}"
}

resource "ibm_compute_vm_instance" "terraform_p_sample" {
  hostname                   = "${var.hostname}"
  domain                     = "${var.domain}"
  os_reference_code          = "UBUNTU_18_64"
  datacenter                 = "dal10"
  network_speed              = "100"
  hourly_billing             = "true"
  private_network_only       = "false"
  cores                      = "1"
  memory                     = "1024"
  disks                      = [25]
  local_disk                 = false
  ssh_key_ids                = [ "${ibm_compute_ssh_key.ssh_key_bin.id}" ]

  connection {
    type = "ssh"
    user = "root"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "yes | sudo apt-get update", 
      "yes | sudo apt install puppetmaster",
      "git clone ${var.repo_git}",
      "cd ${var.repo_name}",
      "puppet apply ${var.puppet_file}"
    ]
  }
}
