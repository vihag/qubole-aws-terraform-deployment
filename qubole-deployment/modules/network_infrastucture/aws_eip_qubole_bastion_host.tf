/*
Creates an EIP to be allocated to the NAT Gateway residing in the public subnetwork of the Qubole dedicated VPC
*/

resource "aws_eip" "qubole_dedicated_vpc_bastion_eip" {
  vpc      = true
  instance = aws_instance.qubole_bastion_host.id
}
