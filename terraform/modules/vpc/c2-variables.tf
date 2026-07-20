variable "vpc_cidr" {
  description = "VPC Cidr block"
  type = string
  default = "10.0.0.0/16"
}

variable "environment_name" {
  description = "Environment name used in resource name and tags"
  type = string
  default = "dev"
}

# variable "aws_region" {
#   description = "Region where the resource will be procured"
#   type = string
#   default = "us-east-1"
# }

variable "tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
  default     = {
    Terraform = "true"
  }
}

variable "cluster_name" {
  description = "EKS cluster name used for subnet tags"
  type        = string
}

variable "subnet_newbits" {
  description = "Number of new bits to add to VPC CIDR to generate subnets (e.g., 8 means /24 from /16)"
  type        = number
  default     = 8
}