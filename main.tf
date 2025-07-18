terraform {
  backend "s3" {
    bucket = "mikey-s3"
    key = "tools/state"
    region = "us-east-1"
  }
}



## github runer

module "tool-infra" {
  for_each = var.tools
  source = "./module-infra"
  ami_id = var.ami_id
  instance_type = each.value["instance_type"]
  name = each.key
  port = each.value["port"]
  zone_id = var.zone_id
  iam_policy = each.value["iam_policy"]
  root_block_device = each.value["root_block_device"]
}
