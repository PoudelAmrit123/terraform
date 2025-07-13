
output "aws_instance_arn" {
    value = aws_instance.amrit_amazon_server.arn
  
}
output "aws_instance_id" {
    value = aws_instance.amrit_amazon_server.id
  
}
output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "instance_id" {
  value = aws_instance.this.id
}