variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://console.bluemix.net/iam#/apikeys"
}

variable "hostname" {

}

variable "domain" {
  default = "ibm.cloud-landingzone.com"
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
