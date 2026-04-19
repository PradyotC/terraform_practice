variable "region" {
  default = "us-east-1"
  type    = string
}

variable "ec2_ami" {
  default = "ami-0ec10929233384c7f"
  type    = string
}

variable "ec2_instance_type" {
  default = "t3.micro"
  type    = string
}
