provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "ci" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "NVentio CI"
    Environment = "ci"
  }
}

resource "aws_subnet" "public-subnet-1" {
  availability_zone = "${var.region}b"
  vpc_id = "${aws_vpc.ci.id}"
  cidr_block = "172.16.10.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "Public #1"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.ci.id}"
}

/*
resource "aws_route53_zone" "ci" {
  name = "ci.nventio.int"
  vpc_id = "${aws_vpc.ci.id}"
}
*/
