#####  Create Load Balancers  #####

resource "aws_lb" "example1-internal-loadbalancer" {
    name = ""
    internal = true
    load_balancer_type = ""
    subnets = [
        module.network.subnet-eu-west-1a-id
    ]

    enable_deletion_protection = true

    tags = {
      "Name" = ""
    }
}

resource "aws_lb" "example1-external-loadbalancer" {
    name = ""
    internal = false
    load_balancer_type = ""

    subnets = [
        module.network.subnet-eu-west-1a-id
    ]

    enable_deletion_protection = true

    tags = {
      "Name" = ""
    }
}

    #####  Create Target Groups  #####

resource "aws_lb_target_group" "target-group-example1" {
    port = 00
    protocol = ""
    target_type = ""
    vpc_id = module.network.graphenus-vpc-id

    health_check {
        interval = 30
        port = 53
        protocol = ""
        timeout = 10
        healthy_threshold = 5
        unhealthy_threshold = 2
  }

    tags = {
        Name = ""
    }
}

resource "aws_lb_target_group" "target-group-example2" {
    port = 88
    protocol = ""
    target_type = ""
    vpc_id = module.network.graphenus-vpc-id

    health_check {
        interval = 30
        port = 88
        protocol = ""
        timeout = 10
        healthy_threshold = 5
        unhealthy_threshold = 2
  }

    tags = {
        Name = ""
    }
}



    #####  Create Listener and Attach Target Groups  #####

resource "aws_lb_listener" "lb-listener-example1" {
    load_balancer_arn = aws_lb.example1-external-loadbalancer.arn
    port = 53

    default_action {
      target_group_arn = aws_lb_target_group.target-group-example1.arn
      type = ""
    }
}

resource "aws_lb_listener" "lb-listener-example2" {
    load_balancer_arn = aws_lb.example1-internal-loadbalancer.arn
    port = 88

    default_action {
      target_group_arn = aws_lb_target_group.target-group-example2.arn
      type = "forward"
    }
}