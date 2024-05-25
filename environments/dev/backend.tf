terraform {
  backend "s3" {
    bucket = "terraform-session-jan-das"
    key    = "_env_/terraform.tfstate"
    region = "us-east-1"

  }
}