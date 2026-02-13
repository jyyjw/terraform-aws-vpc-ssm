resource "aws_vpc" "main_vpc" {

  cidr_block = "10.0.0.0/16"
  #Always leave at default
  instance_tenancy = "default"

  tags = {
    Name = "tf-vpc"
  }
  }

