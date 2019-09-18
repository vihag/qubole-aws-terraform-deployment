/*
Creates a VPC that will be dedicated to use by Qubole.
*/

resource "aws_vpc" "qubole_dedicated_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
}
