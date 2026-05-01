module "s3" {
  source = "./s3"

}

module "ec2" {
  source = "./ec2"
  target_bucket_name = module.s3.aws_bucket_name
}
