output "instance_id" {
  description = "instance id of the instance"
  value       = module.ec2_instance.instance_id

}
output "instnace_arn" {
  description = "arn value of the instance"
  value       = module.ec2_instance.instance_arn

}

output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn

}