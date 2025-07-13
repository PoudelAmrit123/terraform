output "instance_id" {
  description = "instance id of the instance"
    value = module.ec2_instance.aws_instance_id

}
output "instnace_arn" {
    description = "arn value of the instance"
    value = module.ec2_instance.aws_instance_arn

}

output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
  
}