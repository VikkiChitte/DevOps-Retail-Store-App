terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=6.0"
    }
  }
  backend "s3" {
  bucket = "otel-s3-infra-dev-us-east-1-11p5nl"
  key    = "vpc/dev/terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-locks-dev-us-east-1"
}
}

provider "aws" {
  region = var.aws_region
}
