#####  Create AWS EC2 Managed Prefix List  #####

resource "aws_ec2_managed_prefix_list" "example1" {
    address_family = ""
    entry {
            cidr = ""
            description = ""
        }

    entry {
            cidr = ""
            description = ""
        }
    
    entry {
            cidr = ""
            description = ""
        }

    max_entries = 4
    name = ""

    tags = {
        Name = ""
    }
}

resource "aws_ec2_managed_prefix_list" "example2" {
    address_family = ""
    entry {
            cidr = ""
            description = ""
        }
        
    entry {
            cidr = ""
            description = ""
        }
        
    entry {
            cidr = ""
            description = ""
        }
        
    entry {
            cidr = ""
            description = ""
        }
    
    max_entries = 4
    name = ""

    tags = {
        Name = ""
    }
}