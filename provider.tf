terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.8.0"
}

provider "aws" {
  region = "us-east-1"

  # Hard-disable all AWS checks so CI can run without credentials
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true

  # Dummy creds to satisfy the provider schema in CI
  access_key = "dummy"
  secret_key = "dummy"
}
