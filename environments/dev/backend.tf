# Run terraform apply first to create the S3 bucket and DynamoDB table
# Then uncomment this and run terraform init -migrate-state

# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-dev-bucket"
#     key            = "dev/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock-dev"
#     encrypt        = true
#   }
# }
