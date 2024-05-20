 terraform {
  backend "s3" {
    bucket = "terraform-session-jan-das"
    key = "vpc/terraform.tfstate"   // Path to your remote backend file (terraform.tfstate)
    region = "us-east-1"
     }
}