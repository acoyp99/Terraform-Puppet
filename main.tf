
resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}"
}

resource "ibm_compute_vm_instance" "terraform_p_sample" {
  hostname                   = "${var.hostname}"
  domain                     = "${var.domain}"
  os_reference_code          = "${var.os_reference}"
  datacenter                 = "${var.datacenter}"
  network_speed              = "${var.network_speed}"
  hourly_billing             = "${var.hourly_billing}"
  private_network_only       = "${var.network_mode}"
  cores                      = "${var.cores}"
  memory                     = "${var.memory}"
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
      "cd ..",
      "wget -nv -P /downloads https://packages.chef.io/files/stable/chef-workstation/0.18.3/ubuntu/18.04/chef-workstation_0.18.3-1_amd64.deb",
      "dpkg -i /downloads/chef-workstation_0.18.3-1_amd64.deb",
      "echo yes | chef generate repo chef-repo",
      "cd chef-repo/cookbooks",
      "git clone ${var.cookbook_git}",
      "cd ..",
      "chef-client --local-mode --override-runlist ${var.cookbook_name}"
    ]
  }
}
