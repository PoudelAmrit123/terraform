

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

  config = {
    instance_type = "t2.micro"
    ami_id        = "ami-05ffe3c48a9991133"

  }
}



resource "aws_iam_role" "ec2_role" {
  name = "ec2_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "ec2_s3_access_policy"
  description = "Allow EC2 instance to access S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ]
      Resource = [
        "arn:aws:s3:::com.amrit.terraform-backend.lf",
        "arn:aws:s3:::com.amrit.terraform-backend.lf/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn

}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile_v6"
  role = aws_iam_role.ec2_role.name

}



module "ec2_instance" {

  source        = "./../module/ec2"
  ami_id        = local.config.ami_id
  instance_type = local.config.instance_type
  tags = merge(
    local.tags, {
      Name = "EC2 Instance"

  })
  key_name = var.key_name

  s3_bucket_arn = "arn:aws:s3:::com.amrit.terraform-backend.lf"

}
