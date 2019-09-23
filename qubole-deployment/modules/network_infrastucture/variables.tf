variable "deployment_suffix" {
}

variable "data_lake_project_region" {
  default = "ap-southeast-1"
}

variable "public_ssh_key" {
  default = "get from your account"
}

variable "qubole_public_key" {
  default = "get from your account"
}

variable "qubole_tunnel_nat" {
  type    = list(string)
  default = ["52.44.223.209/32", "100.25.6.193/32"]
}

variable "terraform_deployer_key_name" {}