output "ECR-Id" {
  value = aws_ecr_repository.catalog.registry_id
  description = "ECR ID"
}

output "ECR-repository-name" {
  value = aws_ecr_repository.catalog.name
  description = "ECR repository name"
}