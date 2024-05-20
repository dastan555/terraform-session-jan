 resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myVPC"
  }
}

//pulbic subnet 
resource "aws_subnet" "public_subnet" {
    count = 3 
    vpc_id     = aws_vpc.vpc.id
    cidr_block = element ( var.public_cidr_blocks, count.index)
    availability_zone = element( var.public_availability_zones, count.index )
  tags = {
    Name = element (var.names_of_public_subnets, count.index)
  }
}


//private subnet
resource "aws_subnet" "private_subnet" {
    count = 3
    vpc_id     = aws_vpc.vpc.id
    cidr_block = element ( var.private_cidr_blocks, count.index)
    availability_zone = element( var.private_availability_zones, count.index )
  tags = {
    Name = element (var.names_of_private_subnets, count.index)
  }
}

//public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public-route-table"
  }
}     

//private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-route-table"
  }
}    

//associations
resource "aws_route_table_association" "public_subnets_associations" {
    count = 4
    subnet_id = element(aws_subnet.public_subnet[*].id, count.index)
    route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "private_subnets_associations" {
    count = 4
    subnet_id = element(aws_subnet.private_subnet[*].id, count.index)
    route_table_id = aws_route_table.private_rt.id
  
}

//internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

// Elastic IP
 resource "aws_eip" "nat_eip" {
  domain           = "vpc"
}

//nat gateway
resource "aws_nat_gateway" "ngw" {
  connectivity_type = "public"
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet[0].id

  tags = {
    Name = "nat-gateway"
  }
}

//gateway routes
resource "aws_route" "igw_route" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "nat_route" {
  route_table_id            = aws_route_table.private_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.ngw.id
} 



