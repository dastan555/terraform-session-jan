resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

tags = {
    Name = "myVPC"
  }
}

// 3 public subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

tags = {
    Name = "public-3"
  }
}

// 3 private subnets 
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"

tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-1b"

tags = {
    Name = "private-2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1c"

tags = {
    Name = "private-3"
  }
}

// 2 route tables 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_route_table"
  }
}

//internet gateways
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my_internet_gateway"
  }
}

// nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "gw NAT"
  }
}

//Elastic IP

resource "aws_eip" "eip" {
    tags = {
    Name = "elastic-ip"
    }
}

//route table associations

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private_rt.id
}

//routes for gateways
resource "aws_route" "internet_gateway_route" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id 
}


resource "aws_route" "nat_gateway" {
  route_table_id            = aws_route_table.private_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat_gateway.id 
}


# Create a folder called "vpc" in your repository
# 2. Create the following resources
#  - VPC, 10.0.0.0/16
#  - 3 Public Subnets (10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24)  3 Private Subnets (10.0.11.0/24, 10.0.12.0/24, 10.0.13.0/24)
#  - 2 Route Tables
#  - Internet Gateway
#  - Nat Gateway, Elastic IP
#  - Route Table Subnet Associations, Routes for Gateways
