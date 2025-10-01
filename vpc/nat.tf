# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-NAT-EIP"
  }
}

# Create NAT Gateway in the first Public Subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id  # put NAT in first public subnet

  tags = {
    Name = "${var.vpc_name}-NAT-GATEWAY"
  }

  depends_on = [aws_internet_gateway.igw]
}
