# state.tf
terraform {
  backend "s3" {
    bucket = "stefan-intens-project"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
