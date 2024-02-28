#####  Create Network ACL  #####

resource "aws_network_acl" "example1-vpc-network-acl" {
    vpc_id = aws_vpc.example1-vpc.id

    #####  Ingress Allow Rules  #####
  ingress {
    rule_no   = 100
    protocol      = ""
    action   = "allow"
    cidr_block    = ""
    from_port     = 0
    to_port       = 0
  }

    #####  Egress Allow Rules  #####
  egress {
    rule_no   = 100
    protocol      = ""
    action   = "allow"
    cidr_block    = ""
    from_port     = 0
    to_port       = 0
  }

    tags = {
      Name = ""
    }
}

    #####  Subnets Associations  #####

resource "aws_network_acl_association" "example1-network-acl-association" {
  subnet_id      = aws_subnet.example1-subnet.id
  network_acl_id = aws_network_acl.example1-vpc-network-acl.id
}

resource "aws_network_acl_association" "example2-network-acl-association" {
  subnet_id      = aws_subnet.example2-subnet.id
  network_acl_id = aws_network_acl.example1-vpc-network-acl.id
}

resource "aws_network_acl_association" "example3-network-acl-association" {
  subnet_id      = aws_subnet.example3-subnet.id
  network_acl_id = aws_network_acl.example1-vpc-network-acl.id
}