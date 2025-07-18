variable "region" {
  description = "region for the aws"
  type        = string

}

# variable "account_name" {
#   description = "account name "
#   type        = string

# }

variable "account_id" {
  description = "the account id for creating the bucket policy"
  type        = number

}
variable "should_enable_versioning" {
  description = "The versioning of the bucket"
  type        = bool
  default     = false
}

variable "env" {
  description = "env varibable for data backend"
  type        = string
  default     = "dev"
}
# variable "bucket_name" {
#     description = "the name of the bucket"
#     type = string

# }