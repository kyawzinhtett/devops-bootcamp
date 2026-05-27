terraform {

  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.46.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "deployment"

  default_tags {
    tags = {
      Project     = "terraform-aws"
      Environment = "production"
      ManagedBy   = "Terraform"
      Owner       = "kzh"
    }
  }
}