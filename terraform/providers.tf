terraform {
  required_version = ">= 1.10.0"

  # Remote state keeps local machines and GitHub Actions using the same state
  # file. The S3 lockfile prevents two Terraform runs from writing at once.
  backend "s3" {
    bucket       = "devops-bootcamp-terraform"
    key          = "dev/terraform.tfstate"
    region       = "ap-southeast-1"
    profile      = "deployment"
    encrypt      = true
    use_lockfile = true
  }

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
      project     = "devops-bootcamp"
      environment = "dev"
      managed_by  = "terraform"
      owner       = "mms"
    }
  }
}
