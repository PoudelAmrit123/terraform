variable "region" {
  description = "region for the aws"
  type        = string

}
# variable "ami_id" {
#   description = "ami id for the ec2 instance"
#   type = string
# }

variable "key_name" {
  description = "The key value pair for the instance"
  type        = string

}

variable "env" {
  description = "env file for the terraform 2 "
  type        = string

}

