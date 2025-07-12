
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
module "s3_bucket" {
  account_id               = var.account_id
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
      Effect    = "Allow",
      Principal = "arn:aws:iam::${var.account_id}:user/${var.account_name}", // TODO: Need to implement the ec2 instance id later on after the ec2 instance is created.
      Action    = ["s3:GetObject", "s3:PutObject"],
      Resource  = "${module.s3_bucket.bucket_arn}/*"
    }]
  })
}

