resource "aws_ecs_cluster" "intens_container" {
  name = var.ecs_name

  tags = {
    project = "intens-project"
  }
}