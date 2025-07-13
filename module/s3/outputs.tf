output "bucket_arn" {

  value = aws_s3_bucket.amrit-bucket.arn

}

output "bucket_name" {
  value = aws_s3_bucket.amrit-bucket.bucket

}

output "bucket_id" {
  value = aws_s3_bucket.amrit-bucket.id
}

# output "bucket_policy_id" {
#     value = aws_s3_bucket_policy.bucket_policy.id
#  }
