# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

# Create Public Subnets
resource "aws_subnet" "public" {
  count             = 2
  vpc_id           = aws_vpc.main.id
  cidr_block       = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

# Create Private Subnets
resource "aws_subnet" "private" {
  count             = 2
  vpc_id           = aws_vpc.main.id
  cidr_block       = "10.0.${count.index + 2}.0/24"
  map_public_ip_on_launch = false
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

# Internet Gateway for Public Subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-route-table"
  }
}

# Public Route to the Internet via Internet Gateway
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public[*].id)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Create Elastic IP for NAT Gateway (Required)
resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.igw]
}

# Create NAT Gateway in Public Subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "main-nat-gateway"
  }
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}

# Route for Private Subnets to Access Internet via NAT
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_assoc" {
  count          = length(aws_subnet.private[*].id)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
