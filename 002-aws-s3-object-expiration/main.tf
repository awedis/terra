terraform {
  required_version = "1.5.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.s3_name

  lifecycle_rule {
    id      = "expire-1-day-old-objects"
    enabled = true
    prefix  = "temporary/"

    expiration {
      days = 1
    }
  }
}
