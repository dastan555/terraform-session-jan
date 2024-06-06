terraform {
  backend "s3" {
    bucket = "terraform-session-jan-das"
    key    = "dynamodb/terraform.tfstate"
    region = "us-east-1"

  }
}