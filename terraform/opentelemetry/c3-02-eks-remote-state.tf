data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "otel-s3-infra-dev-us-east-1-11p5nl"
    key    = "eks/dev/terraform.tfstate"
    region = var.aws_region
  }
}

output "eks_cluster_name" {
  value = data.terraform_remote_state.eks.outputs.eks_cluster_name
}

output "eks_cluster_id" {
  value = data.terraform_remote_state.eks.outputs.eks_cluster_id
}