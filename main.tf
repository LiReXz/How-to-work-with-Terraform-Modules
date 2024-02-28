#####  Set Terraform  #####

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#####  Configuring the AWS Provider and access keys  #####

provider "aws" {
  region = var.region
  access_key = var.accessKey
  secret_key = var.secretKey
}

#####  Reference modules in the root directory  ##### 

module "iam" {
    source = "./iam"
}

module "compute" {
    source = "./compute"
    depends_on = [
        module.iam,
        module.network,
    ]
    key-pair-example1 = module.iam.key-pair-example1
    iam-example1-role-arn = module.iam.iam-example1-role-arn
    example1-security-group-id = module.network.example1-security-group-id
    network-interface-example1-id = module.network.network-interface-example1-id
    network-interface-example2-id = module.network.network-interface-example2-id
    eip-example1-allocation-id = module.network.eip-example1-allocation-id
    eip-example2-allocation-id = module.network.eip-example2-allocation-id
    example1-subnet-id = module.network.example1-subnet-id
    example1-vpc-id = module.network.example1-vpc-id
}

module "network" {
    source = "./network"
}