output "vpc_id" {
  description = "VPC id"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet id"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "Security Group id for web"
  value       = aws_security_group.web.id
}


