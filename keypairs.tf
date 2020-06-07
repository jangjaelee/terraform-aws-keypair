resource "aws_key_pair" "awx_keypairs" {
  key_name   = var.keypair_name
  public_key = file(var.keypair_file)
}
