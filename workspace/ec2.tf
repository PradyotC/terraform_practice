resource "aws_instance" "myserver" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
}