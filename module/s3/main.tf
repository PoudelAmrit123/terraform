
resource "aws_s3_bucket" "amrit-bucket" {
  bucket = var.bucket_name

  tags = var.tags
}


resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.amrit-bucket.id

  versioning_configuration {
    status = var.should_enable_versioning ? "Enabled" : "Suspended"
  }

}


# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.amrit-bucket.id
# policy = jsonencode(
# {

#   Version = "2012-10-17"
#     Statement = [
#       {
#         Sid = "AllowAccountAccess"
#         Effect = "Allow"
#         Principal = {
#           AWS = "arn:aws:iam::${var.account_id}:root"  
#         }
#         Action = [
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:ListBucket"
#         ]
#         Resource = [
#           "arn:aws:s3:::com.amrit-terraform-backend.lf",
#           "arn:aws:s3:::com.amrit-terraform-backend.lf/*"
#         ]
#       }
#     ]
# }
# )
# }