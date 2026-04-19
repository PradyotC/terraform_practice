resource "aws_s3_bucket" "mybuck" {
  bucket        = "my-s3-buck-usingg-terrorform123"
  force_destroy = true
}

output "buck_arn" {
  value = aws_s3_bucket.mybuck.arn
}

output "bucket_domaine_name" {
  value = aws_s3_bucket.mybuck.bucket_domain_name
}

resource "aws_instance" "myec2" {
  ami                    = "ami-0ea87431b78a82070"
  instance_type          = "t3.micro"
  key_name               = "pradyot"
  vpc_security_group_ids = ["sg-0f95ffe95ae060161"]
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "myec2pserver22"
  }
}

resource "aws_instance" "myec21" {
  ami                    = "ami-0ea87431b78a82070"
  instance_type          = "t3.micro"
  key_name               = "pradyot"
  vpc_security_group_ids = ["sg-0f95ffe95ae060161"]
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "myec2pserver22232"
  }
}
