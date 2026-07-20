module "vpc" {
  source           = "../modules/vpc"
  environment_name = var.environment_name
  vpc_cidr         = var.vpc_cidr
  subnet_newbits   = var.subnet_newbits
  cluster_name     = var.cluster_name
  tags             = var.tags
}