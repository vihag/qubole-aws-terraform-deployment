/*
Creates a AWS Nat gateway, residing in the public subnet
*/

resource "aws_nat_gateway" "qubole_dedicated_vpc_nat_gw" {
  allocation_id = aws_eip.qubole_dedicated_vpc_nat_gw_eip.id
  subnet_id = aws_subnet.qubole_vpc_public_subnetwork.id
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = aws_vpc.qubole_dedicated_vpc.id
  service_name = "com.amazonaws.${var.data_lake_project_region}.s3"
}

