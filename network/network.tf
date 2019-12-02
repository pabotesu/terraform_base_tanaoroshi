/* #1 業務用システムのネットワークを設定*/
/* #1.1 業務用システムのVPCを設定*/
resource "aws_vpc" "for-business-VPC" {
  cidr_block = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
      Name = "for-business-VPC"
  }
}
/* #1.1 業務用システムのVPCを設定 ここまで*/

/* #1.2 業務用システムのIGWを設定*/
resource "aws_internet_gateway" "for-business-IGW" {
  vpc_id = "${aws_vpc.for-business-VPC.id}"
  tags = {
    Name = "for-business-IGW"
  }
}

/* #1.2 業務用システムのIGWを設定 ここまで*/

/* #1.3 業務用システムのパブリックサブネット*/
resource "aws_subnet" "for-business-public-a" {
  vpc_id = "${aws_vpc.for-business-VPC.id}"
  cidr_block = "10.1.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "for-business-public-a"
  }
}

resource "aws_subnet" "for-business-public-c" {
  vpc_id = "${aws_vpc.for-business-VPC.id}"
  cidr_block = "10.1.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "for-business-public-c"
  }
}

resource "aws_route_table" "for-business-public-route" {
  vpc_id = "${aws_vpc.for-business-VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.for-business-IGW.id}"
  }
}

//make public atache
resource "aws_route_table_association" "for-business-public-a" {
    subnet_id = "${aws_subnet.for-business-public-a.id}"
    route_table_id = "${aws_route_table.for-business-public-route.id}"
}

resource "aws_route_table_association" "for-business-public-c" {
    subnet_id = "${aws_subnet.for-business-public-c.id}"
    route_table_id = "${aws_route_table.for-business-public-route.id}"
}
/* #1.3 業務用システムのパブリックサブネットここまで*/

/* #1.4 業務用システムのプライベートサブネット*/
resource "aws_subnet" "for-business-private-a" {
  vpc_id = "${aws_vpc.for-business-VPC.id}"
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "for-business-private-a"
  }
}

/* #1.4 業務用システムのプライベートサブネットここまで*/

/* #1 業務用システムのネットワークを設定 ここまで*/




/* #2 社内システムのネットワークを設定*/
/* #2.1 社内システムのVPCを設定*/
resource "aws_vpc" "in-house-VPC" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
      Name = "in-house-VPC"
  }
}
/* #2.1 社内システムのVPCを設定 ここまで*/

/* #2.2 社内システムのIGWを設定*/
resource "aws_internet_gateway" "in-house-IGW" {
  vpc_id = "${aws_vpc.in-house-VPC.id}"
  tags = {
    Name = "in-house-IGW"
  }
}

/* #2.2 社内システムのIGWを設定 ここまで*/

/* #2.3 社内システムのパブリックサブネット*/
resource "aws_subnet" "in-house-public-a" {
  vpc_id = "${aws_vpc.in-house-VPC.id}"
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "in-house-public-a"
  }
}

resource "aws_route_table" "in-house-public-route" {
  vpc_id = "${aws_vpc.in-house-VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.in-house-IGW.id}"
  }
}

//make public atache
resource "aws_route_table_association" "in-house-public-a" {
    subnet_id = "${aws_subnet.in-house-public-a.id}"
    route_table_id = "${aws_route_table.in-house-public-route.id}"
}


/* #2.3 社内システムのパブリックサブネット　ここまで*/

/* #2.4 社内システムのプライベートサブネット*/
resource "aws_subnet" "in-house-private-a" {
  vpc_id = "${aws_vpc.in-house-VPC.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "in-house-private-a"
  }
}

/* #2.4 社内システムのプライベートサブネットここまで*/



/* #2 社内システムのネットワークを設定ここまで*/
