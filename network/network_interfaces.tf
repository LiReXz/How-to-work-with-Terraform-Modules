#####  Creating Network Interfaces  #####

resource "aws_network_interface" "network-interface-example1" {
    subnet_id = aws_subnet.example1-subnet.id
    private_ips = [""]
    security_groups = [aws_security_group.example1_security_group.id]

    tags = {
      Name = ""
    }
}

resource "aws_network_interface" "network-interface-example2" {
    subnet_id = aws_subnet.example2-subnet.id
    private_ips = [""]
    security_groups = [aws_security_group.example1_security_group.id]

    tags = {
      Name = ""
    }
}
