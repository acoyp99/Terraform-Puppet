variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://console.bluemix.net/iam#/apikeys"
}

variable "hostname" {

}

variable "domain" {
  default = "ibm.cloud-landingzone.com"
}

variable "datacenter" {
  description = ""
  default = "dal10"
}

variable "os_reference" {
  description = ""
  default = "UBUNTU_18_64"
}

variable "network_speed" {
  default = "100"
}

variable "hourly_billing" {
  default = "true"
}

variable "network_mode" {
  description = "true si solo contará con una red privada y false si contará con una red privada una publica "
}

variable "cores" {
  default = "1"
}

variable "memory" {
  default = "1024"
}

variable "ssh_label" {
  default = "Personal"
}

variable "ssh_public_key" {
  description = "Generar un conjunto de llaves SSH-KEYGEN -Public Key- "
}

variable "private_key" {
  description = "Generar un conjunto de llaves SSH-KEYGEN -Private Key- "
}

variable "repo_git" {
  description = "Ingresa la dirección URL del GITHUB que contiene el cookbook "
}

variable "repo_name" {
  description = "Ingrese el nombre del repositorio que contiene el cookbook"
}

variable "puppet_file" {
  description = "Ingresa el nombre del cookbook a ejecutar"
}
