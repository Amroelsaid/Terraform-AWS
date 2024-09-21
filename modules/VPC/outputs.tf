output "vpc_id" {
    value = aws_vpc.vpc_temp.id
}

output "vpc_cidr"{
    value=aws_vpc.vpc_temp.cidr_block
}