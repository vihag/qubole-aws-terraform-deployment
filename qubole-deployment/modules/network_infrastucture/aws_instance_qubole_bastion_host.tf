data "template_file" "qubole_bastion_ssh_bootstrap" {
  template = file("${path.module}/scripts/qubole_bastion_startup.sh")
  vars = {
    public_ssh_key = var.public_ssh_key
    qubole_public_key = var.qubole_public_key
  }
}

resource "aws_instance" "qubole_bastion_host" {
  ami = "ami-0c3326e0cad1779ba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.bastion_security_group.id
  ]
  subnet_id = aws_subnet.qubole_vpc_public_subnetwork.id

  user_data_base64 = base64encode(data.template_file.qubole_bastion_ssh_bootstrap.rendered)

  key_name = var.terraform_deployer_key_name

  tags = {
    Name = "qubole_bastion_host_${var.deployment_suffix}"
  }


}
