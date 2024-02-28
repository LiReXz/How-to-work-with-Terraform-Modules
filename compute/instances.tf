#####  Create Instances  #####

resource "aws_instance" "instance1" {
    ami = local.example1-ami
    instance_type = local.instance_type
    key_name = var.key-pair-example1
    vpc_security_group_ids = [example1-security-group-id]
    
    network_interface {
        device_index = 0
        network_interface_id = var.network-interface-example1-id
    }

    network_interface {
        device_index = 1
        network_interface_id = var.network-interface-example2-id
    }

#####  Create Instance Volumes  #####

    ebs_block_device {
        device_name = "/dev/sdb"
        volume_size = local.normal-volume-size
        volume_type = local.normal-volume-type
    }

    ebs_block_device {
        device_name = "/dev/sdc"
        volume_size = local.normal-volume-size
        volume_type = local.normal-volume-type
    }

    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = local.normal-volume-size
        volume_type = local.normal-volume-type
    }

    tags = {
        Name = ""
    }
}

resource "aws_instance" "instance2" {
    ami = local.example2-ami
    instance_type = local.instance_type
    key_name = var.key-pair-example1
    vpc_security_group_ids = [example1-security-group-id]

    network_interface {
        device_index = 0
        network_interface_id = var.network-interface-example1-id
    }

    network_interface {
        device_index = 1
        network_interface_id = var.network-interface-example2-id
    }

    #####  Create Instance Volumes  #####

    ebs_block_device {
        device_name = "/dev/sdb"
        volume_size = local.normal-volume-size
        volume_type = local.normal-volume-type
    }

    ebs_block_device {
        device_name = "/dev/sdc"
        volume_size = local.normal-volume-size
        volume_type = local.normal-volume-type
    }

    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = local.normal-volume-size
        volume_type = local.normal-volume-type
    }

    tags = {
        Name = ""
    }
}

#####  Associate EIP To instances  #####

resource "aws_eip_association" "instance1-eip-association" {
    instance_id = aws_instance.instance1.id
    allocation_id = var.eip-example1-allocation-id
}

resource "aws_eip_association" "node2-eip-association" {
    instance_id = aws_instance.instance2.id
    allocation_id = var.eip-example2-allocation-id
}