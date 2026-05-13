resource "aws_ecs_service" "intens_app_svc" {
  name            = var.svc_name
  cluster         = aws_ecs_cluster.intens_container.id
  task_definition = aws_ecs_task_definition.intens_api_tdef.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = module.vpc.public_subnets
    security_groups  = [aws_security_group.svc_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = module.alb.target_groups["intens_api"].arn
    container_name   = var.container_name
    container_port   = 8080
  }

  depends_on = [
    module.alb
  ]

  tags = {
    project = "intens-project"
  }
}