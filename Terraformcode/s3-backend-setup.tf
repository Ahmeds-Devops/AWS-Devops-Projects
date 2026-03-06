resource "aws_s3_bucket" "Netflixbackendbucket1" {
    bucket = "netflixterrbackend2"

    
    tags = {
        Name = "Terraform State Storage"
        }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PROVISIONED"
  hash_key     = "LockID"

  read_capacity  = 1  # Minimum value is 1
  write_capacity = 1  # Minimum value is 1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}

