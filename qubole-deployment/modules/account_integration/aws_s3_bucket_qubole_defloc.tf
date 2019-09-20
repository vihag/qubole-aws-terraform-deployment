#s3 bucket for use by qubole control plane
resource "aws_s3_bucket" "qubole-default_location" {
  bucket = "${var.qubole-defloc-name}-${var.deployment_suffix}"
  region = var.data_lake_project_region
  #careful with this
  force_destroy = true
}

output "qubole_defloc" {
  value = aws_s3_bucket.qubole-default_location.arn
}