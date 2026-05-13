variable "region" {
  default = "us-east-1"
}

variable "aws_key_pair_name" {
  default = "stefan-intens-key"
}

variable "vpc_name" {
  default = "stefan-intens-vpc"
}

variable "VPC_CIDR" {
  default = "172.20.0.0/16"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "zone2" {
  default = "us-east-1b"
}

variable "zone3" {
  default = "us-east-1c"
}

variable "pub_sub1" {
  default = "172.20.10.0/24"
}

variable "pub_sub2" {
  default = "172.20.11.0/24"
}

variable "pub_sub3" {
  default = "172.20.12.0/24"
}
