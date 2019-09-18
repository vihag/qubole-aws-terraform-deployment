resource "aws_route_table" "qubole_dedicated_vpc_pub_subnet_route_table" {
  vpc_id = aws_vpc.qubole_dedicated_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.qubole_dedicated_vpc_internet_gw.id
  }

}

resource "aws_vpc_endpoint_route_table_association" "qubole_dedicated_vpc_pub_subnet_s3_route" {
  route_table_id = aws_route_table.qubole_dedicated_vpc_pub_subnet_route_table.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint.id
}
