resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Security group for Load Balancer"
  vpc_id      = module.vpc.vpc_id

  tags = {
    project = "intens-project"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_alb_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_alb_ipv6" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv6         = "::/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_alb" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6_alb" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" 
}

