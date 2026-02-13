#This grabs the newest version of the AMI
data "aws_ami" "ami_value" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Making the public instance
resource "aws_instance" "instance1_public" {
ami = data.aws_ami.ami_value.id
instance_type = "t3.micro"
subnet_id = aws_subnet.public.id
vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_all_outbound.id]
associate_public_ip_address = true

iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

tags = {
    Name = "enhypen-public-113020"
}

}

# Makes a private instance

resource "aws_instance" "instance1_private" {
ami = data.aws_ami.ami_value.id
subnet_id = aws_subnet.private.id
vpc_security_group_ids = [aws_security_group.private_sg.id]
instance_type = "t3.micro"
tags = {
    Name = "forevers-private-031819"
}

}
