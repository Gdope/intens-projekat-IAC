resource "aws_ecs_cluster" "intens_container" {
  name = var.ecs_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    project = "intens-project"
  }
}