#s3 bucket for use by qubole control plane
resource "aws_s3_bucket" "qubole-control-plane-s3-bucket" {
  bucket = var.qubole-defloc-name
  region = var.region
}