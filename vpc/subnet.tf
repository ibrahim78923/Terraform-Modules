# Public Subnets
resource "aws_subnet" "public" {
  count                   = var.public_subnet_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, ceil(log(var.public_subnet_count + var.private_subnet_count, 2)), count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
    Type = "public"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count                   = var.private_subnet_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, ceil(log(var.public_subnet_count + var.private_subnet_count, 2)), var.public_subnet_count + count.index)
  availability_zone       = element(var.azs, var.public_subnet_count + count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-${count.index + 1}"
    Type = "private"
  }
}



















# # Public Subnets (3)
# resource "aws_subnet" "public" {
#   count                   = 3
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = cidrsubnet(var.vpc_cidr, 2, count.index) # 4 subnets from /24
#   availability_zone       = element(var.azs, count.index)
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet-${count.index + 1}"
#     Type = "public"
#   }
# }

# # Private Subnet (1)=
# resource "aws_subnet" "private" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = cidrsubnet(var.vpc_cidr, 2, 3) # last subnet
#   availability_zone       = element(var.azs, 3)
#   map_public_ip_on_launch = false

#   tags = {
#     Name = "private-subnet"
#     Type = "private"
#   }
# }
