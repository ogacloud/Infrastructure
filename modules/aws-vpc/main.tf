provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "flameset-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "${var.env_prefix}-flameset-vpc"
  }
}

resource "aws_subnet" "flameset-subnet-1" {
  vpc_id            = aws_vpc.flameset-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name : "${var.env_prefix}-flameset-subnet-1"
  }

}

resource "aws_route_table" "flameset-route-table" {
  vpc_id = aws_vpc.flameset-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.flameset-igw.id
  }
  tags = {
    Name : "${var.env_prefix}-flameset-rtb"
  }
}

resource "aws_internet_gateway" "flameset-igw" {
  vpc_id = aws_vpc.flameset-vpc.id
  tags = {
    Name : "${var.env_prefix}-flameset-igw"
  }

}

resource "aws_route_table_association" "flameset-rtb-association" {
  subnet_id      = aws_subnet.flameset-subnet-1.id
  route_table_id = aws_route_table.flameset-route-table.id
}

resource "aws_security_group" "flameset-sg" {
  name   = "${var.env_prefix}-flameset-sg"
  vpc_id = aws_vpc.flameset-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_rdp_ips]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.ssh_rdp_ips]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = []
  }

  tags = {
    Name : "${var.env_prefix}-flameset-sg"
  }
}

resource "aws_key_pair" "flameset-ssh-key" {
  key_name   = "flameset-ssh-key"
  public_key = file(var.public_key_location)
}
