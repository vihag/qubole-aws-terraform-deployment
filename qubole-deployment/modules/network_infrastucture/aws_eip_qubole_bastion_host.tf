/*
Creates an EIP to be allocated to the NAT Gateway residing in the public subnetwork of the Qubole dedicated VPC
*/

resource "aws_eip" "qubole_dedicated_vpc_bastion_eip" {
  vpc      = true
  instance = aws_instance.qubole_bastion_host.id
  tags = {
    Name = "qubole_dedicated_vpc_bastion_eip_${var.deployment_suffix}"
  }
}

output "qubole_bastion_host_eip" {
  value = aws_eip.qubole_dedicated_vpc_bastion_eip.public_ip
}

output "qubole_bastion_host_private_ip" {
  value = aws_eip.qubole_dedicated_vpc_bastion_eip.private_ip
}
