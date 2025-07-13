
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

    Creator = "amrit"

  }


}

data "terraform_remote_state" "ec2" {
  backend = "s3"
  config = {
    bucket = "com.amrit.terraform-backend.lf"
    key    = "ec2/${var.env}/terraform.tfstate"
    region = "us-east-1"
  }

}

module "s3_bucket" {
  # account_id               = var.account_id
  source                   = "./../module/s3"
  bucket_name              = "com.amrit.terraform-backend.lf"
  should_enable_versioning = var.should_enable_versioning

  tags = merge(
    local.tags, {
      Name = "S3 bucket"
    }

  )

}



resource "aws_s3_bucket_policy" "policy" {
  bucket = module.s3_bucket.bucket_name



  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = data.terraform_remote_state.ec2.outputs.ec2_role_arn
      }
      Action   = ["s3:GetObject", "s3:PutObject"],
      Resource = "${module.s3_bucket.bucket_arn}/*"
    }]
  })
}

