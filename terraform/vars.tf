variable "REGION" {
  default = "eu-north-1"
}

variable "AMI" {
  default = "ami-0914547665e6a707c"
}

variable "INSTANCE_TYPE" {
  default = "t3.micro"
}

variable "KEY_NAME" {
  default = "project-w-key-pair"
}

variable "VPC_SECURITY_GROUP_IDS" {
  default = ["sg-05a161f30f7fde50d"]
}

variable "RESOURCE_TAG_NAME" {
  default = "project-w-terraform-instance"
}