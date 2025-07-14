variable "tags" {
  description = "tags"
  type        = map(string)
}


variable "ami_id" {
  description = "ami id value"

}
variable "instance_type" {
  description = "ami instance type"

}
variable "key_name" {
  description = "key name "

}


variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket to allow access"
  type        = string
}

variable "instance_profile_name_v5" {
  description = "Name for the IAM instance profile"
  type        = string
  default     = "ec2_instance_profile_v5"
}

variable "role_name" {
  description = "Name for the IAM role"
  type        = string
  default     = "ec2_access_s3_role_v5"
}

variable "policy_name" {
  description = "Name for the IAM policy"
  type        = string
  default     = "ec2_s3_access_policy_v2"
}

variable "env" {

  description = "env value "
  type        = string

}