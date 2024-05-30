terraform {
  backend "s3" {
    bucket = "terraform-session-jan-das"
    key    = "extras/terraform.tfstate"
    region = "us-east-1"

  }
}