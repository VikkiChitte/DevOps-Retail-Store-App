resource "aws_ecr_repository" "ui_ecr_repo" {
  name                 = "retail-ecr-ui-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}