terraform {
  backend "s3" {
    bucket = "terraform-s3-backend-pravin"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "terraform-backend-pravin"
  }
}