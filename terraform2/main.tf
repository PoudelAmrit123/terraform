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




module "ec2_s3_bucket" {
  # account_id               = var.account_id
  source                   = "./../module/s3"
  bucket_name              = "com.amrit.terraform-bucket-${var.env}"
  should_enable_versioning = var.should_enable_versioning
  env                      = var.env

  tags = merge(
    local.tags, {
      Name = "EC2 instance S3 bucket "
    }

  )

}



resource "aws_s3_bucket_policy" "policy" {
  bucket = module.ec2_s3_bucket.bucket_name



  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "arn:aws:iam::${var.account_id}:role/ec2_access_s3_role_${var.env}"
      }
      Action   = ["s3:GetObject", "s3:PutObject"],
      Resource = "${module.ec2_s3_bucket.bucket_arn}/*"
    }]
  })
}

