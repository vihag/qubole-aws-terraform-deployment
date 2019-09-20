resource "aws_vpc" "hive_metastore_dedicated_vpc" {
  cidr_block = "11.0.0.0/16"
  enable_dns_support = true

  tags = {
    Name = "hive_metastore_dedicated_vpc_${var.deployment_suffix}"
  }

}
