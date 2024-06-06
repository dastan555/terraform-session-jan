terraform {
  backend "s3" {
    bucket = "terraform-session-jan-das"
    key    = "session-9/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt = true

  }
}