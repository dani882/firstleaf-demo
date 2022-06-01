terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {}

# Create VPC for the cluster
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "firstleaf-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    made_with = "terraform"
  }
}

# Create security groups
module "http_80_security_group" {
  source              = "terraform-aws-modules/security-group/aws//modules/http-80"
  version             = "~> 4.0"
  name                = var.sg_name
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

# Create the ECS cluster
module "cluster" {
  source = "./ecs-cluster"

  project_name    = var.project_name
  security_groups = [module.http_80_security_group.security_group_id]
  subnets         = module.vpc.public_subnets
}