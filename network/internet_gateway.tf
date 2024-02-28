#####  Defining Internet Gateways  #####

resource "aws_internet_gateway" "example1-gateway" {
    vpc_id = aws_vpc.example1-vpc.id

    tags = {
        Name = ""
    }
}