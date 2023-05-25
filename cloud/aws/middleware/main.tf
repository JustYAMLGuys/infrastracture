# Create a new VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  tags = var.common_tags
}

# Create an internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = var.common_tags
}

# Create public subnets with associated route table pointing to the Internet Gateway
resource "aws_subnet" "public_subnet" {
  count = var.subnet_count
  cidr_block = cidrsubnet(var.cidr_block, var.newbits, count.index)
  vpc_id = aws_vpc.my_vpc.id
  map_public_ip_on_launch = true
  tags = merge({ Name = "Public Subnet ${count.index+1}" }, var.common_tags)
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = merge({ Name = "Public Route Table" }, var.common_tags)
}

resource "aws_route_table_association" "public_subnet_association" {
  count = var.subnet_count
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Create private subnets with associated route table pointing to the NAT Gateway
resource "aws_subnet" "private_subnet" {
  for_each = var.create_private_subnets ? { for i in range(var.subnet_count) : tostring(i) => i } : {}
  cidr_block = cidrsubnet(var.cidr_block, var.newbits, each.key)
  vpc_id = aws_vpc.my_vpc.id
  tags = merge({ Name = "Private Subnet ${each.key}" }, var.common_tags)
}

resource "aws_eip" "nat_gateway_eip" {
  for_each = var.single_nat_gateway && var.create_private_subnets ? { "single" = 1 } : var.create_private_subnets ? { for i in range(var.subnet_count) : tostring(i) => i } : {}
  tags = merge({ Name = "NAT Gateway EIP ${each.key}" }, var.common_tags)
}

resource "aws_nat_gateway" "nat_gateway" {
  for_each = var.single_nat_gateway && var.create_private_subnets ? { "single" = 1 } : var.create_private_subnets ? { for i in range(var.subnet_count) : tostring(i) => i } : {}
  allocation_id = aws_eip.nat_gateway_eip[each.key].id
  subnet_id = var.single_nat_gateway ? aws_subnet.public_subnet[0].id : aws_subnet.public_subnet[each.key].id
  tags = merge({ Name = "NAT Gateway ${each.key}" }, var.common_tags)
}

resource "aws_route_table" "private_route_table" {
  for_each = var.create_private_subnets ? { for i in range(var.subnet_count) : tostring(i) => i } : {}
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.cidr_route
    nat_gateway_id = var.single_nat_gateway && var.create_private_subnets ? aws_nat_gateway.nat_gateway["single"].id : aws_nat_gateway.nat_gateway[each.key].id
  }

  tags = merge({ Name = "Private Route Table ${each.key}" }, var.common_tags)
}

resource "aws_route53_zone" "private_zone" {
  for_each = var.create_zone ? { "zone" = 1 } : {}
  name = var.zone_name
  comment = var.zone_comment
  vpc {
    vpc_id = aws_vpc.my_vpc.id
  }
  tags = merge({ Name = "Private Hosted Zone" }, var.common_tags)
}
