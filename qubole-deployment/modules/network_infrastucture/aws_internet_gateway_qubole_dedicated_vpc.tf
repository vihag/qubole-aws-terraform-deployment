/*
Creates a AWS Internet gateway, residing in the public subnet
*/

resource "aws_internet_gateway" "qubole_dedicated_vpc_internet_gw" {
vpc_id = aws_vpc.qubole_dedicated_vpc.id
}


