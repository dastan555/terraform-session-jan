terraform {
    backend "s3" {
        bucket = "terraform-session-jan-das"
        key = "session-3/terraform.tfstate"
        region = "us-east-1"
    }
}