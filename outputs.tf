
output "aws_default_vpc_data" {
    value       = data.aws_vpc.default_vpc
}

output "aws_default_security_group_data" {
    value       = data.aws_security_group.default_security_group
}

output "aws_subnets_data" {
    value       = data.aws_subnet_ids.vpc_subnets
}

output "aws_subnet_group_data" {
    value       = [for element in data.aws_subnet.vpc_subnet_ids : element]
}
