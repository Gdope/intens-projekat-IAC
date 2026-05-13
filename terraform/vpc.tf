module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.VPC_CIDR

  azs             = [var.zone1, var.zone2, var.zone3]
  public_subnets  = [var.pub_sub1, var.pub_sub2, var.pub_sub3]


  enable_dns_hostnames = true
  map_public_ip_on_launch = true
  enable_dns_support = true

  tags = {
    project = "intens-project"
  }
}