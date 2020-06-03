terraform {
  required_version = ">= 0.11.0"
}

variable "vault_addr" {
  description = "vault address"
  default = ""
  }

# Set VAULT_TOKEN environment variable
provider "vault" {
  address = "${var.vault_addr}"
  max_lease_ttl_seconds = 1500
}

# AWS credentials from Vault
# Must set up AWS backend in Vault on path aws with role deploy
data "vault_aws_access_credentials" "aws_creds" {
  backend = "aws-tf"
  role = "deploy"
}

provider "aws" {
  region = "us-east-1"
  access_key = "${data.vault_aws_access_credentials.aws_creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.aws_creds.secret_key}"
}



