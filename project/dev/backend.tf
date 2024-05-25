terraform {
  backend "s3" {
    bucket = "terraform-session-jan-das"
    key    = "project/dev/terraform.tfstate"
    region = "us-east-1"

  }
}