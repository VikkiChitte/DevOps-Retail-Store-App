terraform {
  required_version = ">=1.5.7"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 6.20"
    }

    helm = {
        source = "hashicorp/helm"
        version = "~> 3.0"
    }

    kubernetes = {
        source = "hashicorp/kubernetes"
        version = ">=2.28"
    }
  }

  backend "s3" {
    bucket          = "otel-s3-infra-dev-us-east-1-11p5nl"
    key             = "karpenter/dev/terraform.tfstate"
    region          = "us-east-1"
    dynamodb_table  = "terraform-locks-dev-us-east-1"
    }
}

provider "aws" {
  region = var.aws_region
}