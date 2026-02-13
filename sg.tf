# Allow HTTP SG

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_rule" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

#Private SG

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Used by private EC2s"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "private-sg"
  }
}

resource "aws_security_group" "allow_all_outbound" {
  name        = "allow_all_outbound"
  description = "Allow outbound connections"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "allow-all-outbound"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_rule" {
  security_group_id = aws_security_group.allow_all_outbound.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

