resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)

  tags = merge(
    {
      "Name" = format("%s-keypair", var.key_name)
    },
    local.common_tags,
  )
}