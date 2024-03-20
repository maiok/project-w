resource "aws_instance" "project_w" {
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  key_name               = var.KEY_NAME
  vpc_security_group_ids = var.VPC_SECURITY_GROUP_IDS
  tags = {
    Name = var.RESOURCE_TAG_NAME
  }
}
