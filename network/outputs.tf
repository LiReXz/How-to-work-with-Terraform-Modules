output "example1-security-group-id" {
    value = aws_security_group.example1_security_group.id
}

output "network-interface-example1-id" {
    value = aws_network_interface.network-interface-example1.id
}

output "network-interface-example2-id" {
    value = aws_network_interface.network-interface-example2.id
}

output "aws-eip-example1-allocation-id" {
    value = aws_eip.example1-eip.allocation_id
}

output "aws-eip-node2-allocation-id" {
    value = aws_eip.example2-eip.allocation_id
}

output "example1-subnet-id" {
    value = aws_subnet.example1-subnet.id
}

output "example1-vpc-id" {
    value = aws_vpc.example1-vpc.id
}
