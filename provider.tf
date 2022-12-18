terraform {
  required_version = ">= 0.13.1"   # range is v0.13.1 to v1.3.6 (latest as of 12/18/2022)

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}