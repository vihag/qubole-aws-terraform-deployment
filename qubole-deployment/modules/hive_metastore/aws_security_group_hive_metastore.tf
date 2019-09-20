/*
Creates a Security group that
 1. Allows ingress to the Bastion Host from Qubole's Tunneling NAT
 2. Allows ingress to the Bastion Host from the Private Subnet in the Qubole Dedicated VPC

 This is for the following reason:
 1. Qubole Control Plane will talk(e.g. command submissions) to the Qubole Clusters via the Bastion Host
*/

resource "aws_security_group" "hive_metastore_security_group" {
  name = "hive_metastore_security_group"
  vpc_id = aws_vpc.hive_metastore_dedicated_vpc.id

  ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    cidr_blocks = ["${var.qubole_bastion_private_ip}/32"]   #TODO no way to specify only an IP. it has to be a CIDR block
  }

  ingress {
    from_port = 20557
    protocol = "tcp"
    to_port = 20557
    cidr_blocks = ["${var.qubole_bastion_private_ip}/32"]   #TODO no way to specify only an IP. it has to be a CIDR block
  }

  ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    cidr_blocks = [var.qubole_dedicated_vpc_priv_subnet_cidr]
  }

}
