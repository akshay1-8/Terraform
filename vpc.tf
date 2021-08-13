terraform {
        backend "local" {}

}


provider "aws"{
        region ="us-west-2"
}

module "vpc"{

        source = "terraform-aws-modules/vpc/aws"
        cidr = "10.200.0.0/16"
        azs = ["usw2-az2", "usw2-az1"]
        private_subnets = ["10.200.1.0/24", "10.200.2.0/24"]
        public_subnets = ["10.200.10.0/24", "10.200.20.0/24"]
        tags= {
                name = "Proof of concept"
                terraform = "true"
        }
}

data "aws_availability_zones" "az" {

  state = "available"

}

output "vpc_id" {

  value = module.vpc.vpc_id

}

output "private_subnets" {

  value = module.vpc.private_subnets

}

output "public_subnets" {

  value = module.vpc.public_subnets

}
