terraform {
  backend "s3" {
    bucket = "s3statenotchanged-dyanmodb-810"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true    
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
  profile = "default"
}