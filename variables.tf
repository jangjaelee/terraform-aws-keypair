variable "key_name" {
  description = "Key name of Keypair"
  type        = string
}

variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/id_rsa.pub
DESCRIPTION
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment"
  type = string
}