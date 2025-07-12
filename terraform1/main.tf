terraform {

   required_version = ">= 1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = var.region
}


locals {
  tags = {
    
   
    Creator     = "amrit"
    

  }

  config = {
    instance_type             = "t2.micro"
    ami_id                    = "ami-05ffe3c48a9991133"
    
  }
}



module "ec2_instance" {
      count          = terraform.workspace == "prod" ? 1 : 1
      source         = "../../modules/ec2"
      ami_id         = local.config.ami_id
      instance_type  = local.config.instance_type
      tags           = merge(
        local.tags , {
        Name = "EC2 Instance"

    })
    key_name = var.key_name
  
  
}
