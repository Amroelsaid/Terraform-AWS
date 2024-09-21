output "public_subnets" {
  value = [for subnet in aws_subnet.subnets : subnet.id if subnet.map_public_ip_on_launch]
}

output "private_subnets" {
  value = [for subnet in aws_subnet.subnets : subnet.id if !subnet.map_public_ip_on_launch]
}
