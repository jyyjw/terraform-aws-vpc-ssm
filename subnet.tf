resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"

  #maps public IPs to anything on it
  map_public_ip_on_launch = true


  tags = {
    Name = "tf-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tf-private"
  }
}