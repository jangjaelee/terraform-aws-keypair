# Amazon EC2 key paris Terraform module

Terraform module which creates Keypair resources on AWS.

These types of resources are supported:

* [Keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)


## Usage
### Create Keypair

main.tf
```hcl
module "keypair" {
  source = "git@github.com:jangjaelee/terraform-aws-keypair.git"

  key_name = local.vpc_name
  public_key_path = "./ec2_keypair/id_rsa.pub"

  env = "dev"
}
```

locals.tf
```hcl
locals {
  vpc_name = "KubeSphere-dev"
  cluster_name = "KubeSphere-v121-dev"
  cluster_version = "1.21"
}
```

providers.tf
```hcl
provider "aws" {
  version = ">= 3.2.0"
  region = var.region
  allowed_account_ids = var.account_id
  profile = "eks_service"
}
```

terraform.tf
```hcl
terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket = "kubesphere-terraform-state-backend"
    key = "kubesphere/keypair/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "kubesphere-terraform-state-locks"
    encrypt = true
  profile = "eks_service"
  }
}
```

variables.tf
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type        = list(string)
  default     = ["123456789012"]
}
```
