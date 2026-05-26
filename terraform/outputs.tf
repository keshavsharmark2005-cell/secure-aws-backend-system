# Output generated VPC identifier

output "production_vpc_id" {
  value = aws_vpc.production_vpc.id
}