provider "aws" {
  region = "${var.region}"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "172.22.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "Example VPC"
  }
}

# Create a private subnet in two AZs
resource "aws_subnet" "private-subnet-1" {
  availability_zone = "${var.region}b"
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "172.22.100.0/24"
  tags {
    Name = "Private #1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  availability_zone = "${var.region}c"
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "172.22.101.0/24"
  tags {
    Name = "Private #2"
  }
}

# Create a public subnet in two AZs
resource "aws_subnet" "public-subnet-1" {
  availability_zone = "${var.region}b"
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "172.22.10.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "Public #1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  availability_zone = "${var.region}c"
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "172.22.11.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "Public #2"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.example.id}"
}

# Create NAT instance
resource "aws_instance" "nat" {
  ami = "${lookup(var.nat_amis, var.region)}"
  instance_type = "t1.micro"
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  key_name = "likwid"
  associate_public_ip_address = true
  source_dest_check = false
  tags {
    Name = "NAT #1"
  }
}
