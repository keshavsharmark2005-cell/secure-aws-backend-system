# Create primary cloud network

resource "aws_vpc" "production_vpc" {
  cidr_block = "172.16.0.0/16"
}

# Configure public application subnet

resource "aws_subnet" "frontend_subnet" {
  vpc_id     = aws_vpc.production_vpc.id
  cidr_block = "172.16.1.0/24"
}

# Configure isolated database subnet

resource "aws_subnet" "database_subnet" {
  vpc_id     = aws_vpc.production_vpc.id
  cidr_block = "172.16.2.0/24"
}