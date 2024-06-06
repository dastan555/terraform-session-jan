provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [ ]
  profile = "default"
}

terraform {
  cloud {
    organization = "My-Organization--Dastan555"


    workspaces {
      name = "dev"
    }
  }
}
