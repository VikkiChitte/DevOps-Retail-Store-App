data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "otel-s3-infra-dev-us-east-1-11p5nl"
    key    = "vpc/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}