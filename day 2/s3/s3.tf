resource "aws_s3_bucket" "mybuckP1" {
  bucket        = var.buck-name
  force_destroy = true
}
