variable "region" {
    description = "region for the aws"
  
}



variable "account_id" {
    description = "the account id for creating the bucket policy"
  
}
variable "should_enable_versioning" {
    description = "The versioning of the bucket"  
}
variable "bucket_name" {
    description = "the name of the bucket"
  
}