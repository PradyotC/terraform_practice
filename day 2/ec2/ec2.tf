resource "aws_instance" "myec2" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_keypair_name
  vpc_security_group_ids = [var.ec2_security_group_id]
  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }
  user_data = file("./ec2/user.txt")
  tags = {
    Name = var.ec2_tag_name
  }
}
