output "instance_profile_name" {
  description = "The name of the IAM instance profile"
  value       = aws_iam_instance_profile.this.name
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.amrit_amazon_server.id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.amrit_amazon_server.arn
}

output "role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.this.name
}
