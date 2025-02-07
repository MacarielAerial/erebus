terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.86.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "example_profile"
  default_tags {
    tags = {
      Environment = "Dev"
      Name        = "IaC"
    }
  }
}