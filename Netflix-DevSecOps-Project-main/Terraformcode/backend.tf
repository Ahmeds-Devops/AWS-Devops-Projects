# backend.tf

terraform {
   backend "s3" {
     bucket         = <yourbucketname>
     key            = "terraform/state.tfstate"  # Path to the state file inside the S3 bucket
     region         = "ap-south-1"               # Your AWS region
     encrypt        = true                       # State file should be encrypted
     dynamodb_table = <dynamodb-table>          # DynamoDB table for state locking
   }
 }
