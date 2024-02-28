#####  Create Launch Templates  #####

resource "aws_launch_template" "launch-template-example1" {
    name = "Insert launch template name"
    image_id = local.example1-ami
    instance_type = local.instance_type
    key_name = module.iam.key-pair-name
    
    block_device_mappings {
        device_name = "/dev/sda1"
        
        ebs {
            volume_size = local.normal-volume-size
            volume_type = local.normal-volume-type
            delete_on_termination = true
        }
    }

    block_device_mappings {
        device_name = "/dev/sdb"
        
        ebs {
            volume_size = local.normal-volume-size
            volume_type = local.normal-volume-type
        }
    }

    block_device_mappings {
        device_name = "/dev/sdc"
        
        ebs {
            volume_size = local.normal-volume-size
            volume_type = local.normal-volume-type
        }
    }

    network_interfaces {
        device_index = 0
        network_interface_id = module.network.network-interface-graphenus-node2-id
    }

    network_interfaces {
        device_index = 1
        network_interface_id = module.network.network-interface-graphenus-data-node2-id
    }

    user_data = <<-EOF
                #!/bin/bash                
                EOF
}

resource "aws_launch_template" "launch_template_example2" {
    name = "Insert launch template name"
    image_id = local.example2-ami
    instance_type = local.instance_type
    key_name = module.iam.key-pair-name
    vpc_security_group_ids = [module.network.graphenus-sg-id]
    
    block_device_mappings {
        device_name = "/dev/sda1"
        
        ebs {
            volume_size = local.normal-volume-size
            volume_type = local.normal-volume-type
            delete_on_termination = true
        }
    }

    block_device_mappings {
        device_name = "/dev/sdb"
        
        ebs {
            volume_size = local.normal-volume-size
            volume_type = local.normal-volume-type
        }
    }

    block_device_mappings {
        device_name = "/dev/sdc"
        
        ebs {
            volume_size = local.normal-volume-size
            volume_type = local.normal-volume-type
        }
    }

    network_interfaces {
        device_index = 0
        subnet_id = module.network.subnet-eu-west-1a-id
    }


    user_data = <<-EOF
                #!/bin/bash
                EOF
}