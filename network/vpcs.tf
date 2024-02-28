#####  Create VPCs  #####

resource "aws_vpc" "example1-vpc" {
    cidr_block = ""
  
    tags = {
        Name = ""
  }
}