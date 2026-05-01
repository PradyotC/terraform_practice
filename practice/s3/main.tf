resource "aws_s3_bucket" "mytfbuck" {
  bucket = var.s3_bucket_name

  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mytfbuck.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "allow_public_read" {
  statement {
    sid    = "PublicRead"
    effect = "Allow"
    
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.mytfbuck.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  depends_on = [aws_s3_bucket_public_access_block.example]
  
  bucket = aws_s3_bucket.mytfbuck.id
  policy = data.aws_iam_policy_document.allow_public_read.json
}