
#Make sure to name these...

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    #Must be a capital N
    Name = "public-route"
}

}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    #Must be a capital N
    Name = "private-route"
}
}

resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_route.id
  
}

