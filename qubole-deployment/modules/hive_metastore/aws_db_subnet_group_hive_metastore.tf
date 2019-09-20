resource "aws_db_subnet_group" "hive_metastore_subnet_group" {
  name       = "hive_metastore_subnet_group"
  subnet_ids = [aws_subnet.hive_metastore_subnet_primary.id, aws_subnet.hive_metastore_subnet_secondary.id]
}