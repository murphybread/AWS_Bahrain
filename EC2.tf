#----------------ec2---------------
#public 배스쳔호스트
resource "aws_instance" "global-public-ec2-a" {
  ami               = var.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = var.az_a
  key_name          = "teamsol-eu-west-3"

  subnet_id = aws_subnet.global-public-subnet-a.id
  vpc_security_group_ids = [
    aws_security_group.global-public-sg-bastion.id
  ]
  tags = {
    Name = "global-public-ec2-a"
  }
}

resource "aws_instance" "global-public-ec2-c" {
  ami               = var.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = var.az_c
  key_name          = "teamsol-eu-west-3"

  subnet_id = aws_subnet.global-public-subnet-c.id
  vpc_security_group_ids = [
    aws_security_group.global-public-sg-bastion.id
  ]
  tags = {
    Name = "global-public-ec2-c"
  }
}