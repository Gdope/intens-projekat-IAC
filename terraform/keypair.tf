resource "aws_key_pair" "stefan_intens_key" {
  key_name   = var.aws_key_pair_name
  public_key = file("${path.module}/keys/stefan-intens-key.pub")
}