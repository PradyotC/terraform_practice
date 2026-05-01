# 1. Create an IAM Role for the EC2 Instance
resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2_s3_access_role_pradyot"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# 2. Attach S3 write permissions to that Role
resource "aws_iam_role_policy" "s3_write_policy" {
  name = "ec2_s3_write_policy"
  role = aws_iam_role.ec2_s3_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:PutObject", "s3:PutObjectAcl"]
        Resource = "arn:aws:s3:::${var.target_bucket_name}/*"
      }
    ]
  })
}

# 3. Create the Instance Profile (the bridge between EC2 and the Role)
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_s3_profile_pradyot"
  role = aws_iam_role.ec2_s3_role.name
}


resource "aws_instance" "myec2instance" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_keypair_name
  vpc_security_group_ids = [var.ec2_security_group_id]

  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > index.html
    aws s3 cp index.html s3://${var.target_bucket_name}/index.html
    rm index.html
  EOF

}
