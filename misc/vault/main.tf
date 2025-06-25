terraform {
  backend "s3" {
    bucket = "mikey-s3"
    key    = "vault_secrets/state"
    region = "us-east-1"
  }
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}


provider "vault" {
  address = "http://vault.mikeydevops1.online:8200/"
  token = var.token
}



variable "token" {
  default = ""
}

resource "vault_mount" "ssh" {
  path = "infra"
  type = "kv"
  options = { version = "2" }
  description = "ssh vault_mount"
}

resource "vault_generic_secret" "example" {
  path = "${vault_mount.ssh.path}/ssh"

  data_json = <<EOT
{
  "username":   "ec2-user",
  "password": "DevOps321"
}
EOT
}