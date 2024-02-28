#####  Create Subnets  #####

resource "aws_subnet" "example1-subnet" {
    vpc_id = aws_vpc.example1-vpc.id
    cidr_block = ""
    availability_zone = ""
    
    tags = {
        Name = ""
    }
}

resource "aws_subnet" "example2-subnet" {
    vpc_id = aws_vpc.example1-vpc.id
    cidr_block = ""
    availability_zone = ""
    
    tags = {
        Name = ""
    }
}

resource "aws_subnet" "example3-subnet" {
    vpc_id = aws_vpc.example1-vpc.id
    cidr_block = ""
    availability_zone = ""
    
    tags = {
        Name = ""
    }
}