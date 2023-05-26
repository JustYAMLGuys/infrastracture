# Create the S3 bucket
resource "aws_s3_bucket" "tfstate" {
  bucket      = var.bucket_name
  acl         = "private"
  
  versioning {
    enabled   = true
  }

  lifecycle {
    prevent_destroy = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Create the DynamoDB table
resource "aws_dynamodb_table" "tf_locks" {
  name           = var.dynamodb_table_name
  billing_mode   = var.dynamodb_billing_mode
  hash_key       = "LockID"
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity

  attribute {
    name         = "LockID"
    type         = "S"
  }
}
