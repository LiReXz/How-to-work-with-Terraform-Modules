#####  Defining Elastic IPs  #####

resource "aws_eip" "example1-eip" {
    
    tags = {
      Name = ""
    }
}

resource "aws_eip" "example2-eip" {

    tags = {
      Name = ""
    }
}