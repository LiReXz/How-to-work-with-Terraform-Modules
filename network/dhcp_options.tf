#####  Create Graphenus DHCP options  #####

resource "aws_vpc_dhcp_options" "example1-dhcp-options" {
    domain_name = ""
    domain_name_servers = [""]
    ntp_servers = [""]
    
    tags = {
        Name = ""
  }
}

#####  Associate DHCP Options with VPC  #####

resource "aws_vpc_dhcp_options_association" "main-dhcp-options" {
  vpc_id            = aws_vpc.example1-vpc.id
  dhcp_options_id   = aws_vpc_dhcp_options.example1-dhcp-options.id
}