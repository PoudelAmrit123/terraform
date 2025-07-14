variable "tags" {
  description = "Tag for the aws resources"

}

# variable "account_id" {
#   description = "account id Value"

# }
variable "bucket_name" {
  description = "bucket name to create"
}
variable "should_enable_versioning" {
  description = "should versioning be enabled"
  type        = bool

}

variable "env" {
  description = "env value "
  type = string
  
}