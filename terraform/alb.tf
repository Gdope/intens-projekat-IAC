module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name                       = var.alb_name
  load_balancer_type         = "application"
  internal                   = false
  enable_deletion_protection = false

  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  security_groups = [aws_security_group.alb_sg.id]

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"

      forward = {
        target_group_key = "intens_api"
      }
    }
  }

  target_groups = {
    intens_api = {
      name_prefix       = "int-"
      protocol          = "HTTP"
      port              = 8080
      target_type       = "ip"
      create_attachment = false

      health_check = {
        enabled             = true
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 3
      }
    }
  }

  tags = {
    project = "intens-project"
  }
}