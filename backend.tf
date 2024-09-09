#Create a S3 bucket to store the terraform state file
resource "aws_s3_bucket" "mybucketOne" {
    bucket = "s3statenotchanged-dyanmodb-810"

  tags = {
    Name        = "MybucketOne"
  }
    versioning {
        enabled = true
  }
  server_side_encryption_configuration{
   rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"


    }
  }
}
}


#Create Dyanmo Db to enable state locking
resource "aws_dynamodb_table" "statelock" {
    name = "state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}
