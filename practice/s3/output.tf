output "aws_bucket_name" {
  value = "${aws_s3_bucket.mytfbuck.id}"
}

output "s3_domain_name" {
  value = aws_s3_bucket.mytfbuck.bucket_domain_name
}