#####  Create Security Groups  #####

resource "aws_security_group" "example1_security_group" {
    name_prefix = ""
    description = ""

    #####  Ingress Rule SSH Allow  #####
    ingress {
        from_port = 22
        to_port = 22
        protocol = ""
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    #####  Egress Rule Allow everywhere  #####
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        security_groups = [ aws_ec2_managed_prefix_list.example1 ]
    }

    tags = {
        Name = ""
    }
}