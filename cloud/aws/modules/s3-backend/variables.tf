variable "bucket_name" {
  default = "terraform-aws-s3-bucket"
  type    = string
}
variable "dynamodb_table_name" {
  default = "terraform-aws-dynamodb-table"
  type    = string
}

variable "dynamodb_billing_mode" {
  default = "PAY_PER_REQUEST"
  type    = string
}

variable "dynamodb_read_capacity" {
  default = 5
  type    = number
}

variable "dynamodb_write_capacity" {
  default = 5
  type    = number
}