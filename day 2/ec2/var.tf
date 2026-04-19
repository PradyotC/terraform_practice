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

variable "ec2_keypair_name" {
  default = "pradyot"
  type    = string
}

variable "ec2_security_group_id" {
  default = "sg-0f95ffe95ae060161"
  type    = string
}

variable "ec2_volume_size" {
  default = "10"
  type    = number
}

variable "ec2_volume_type" {
  default = "gp3"
  type    = string
}

variable "ec2_tag_name" {
  default = "terraformpcv1"
  type    = string
}