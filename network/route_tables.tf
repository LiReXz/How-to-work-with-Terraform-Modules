#####  Create Route Tables  #####

    #####  Create Public Route Table  #####

resource "aws_route_table" "example1-route-table" {
    vpc_id = aws_vpc.example1-vpc.id

    route {

        cidr_block = ""
        gateway_id = aws_internet_gateway.example1-gateway.id
    }

    route {
        cidr_block = ""
    }

    tags = {
        Name = ""
    }
}