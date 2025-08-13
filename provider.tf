terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }


backend "s3" {
    bucket = "devops-state-dev"
    key    = "eksctl"
    region = "us-east-1"
    dynamodb_table = "devops-locking-dev"
    }

}

provider "aws" {
  region = "us-east-1"
}
