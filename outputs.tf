output "info-keypair-name" {
  value = aws_key_pair.awx_keypairs.key_name
}

output "info-keypair-id" {
  value = aws_key_pair.awx_keypairs.key_pair_id
}
