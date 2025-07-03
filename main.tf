terraform {
  backend "s3" {
    bucket = "mikey-s3"
    key = "tools/state"
    region = "us-east-1"
  }
}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

# variable "instance_type" {
#   default = "t3.small"
# }

variable "zone_id" {
  default = "Z09180393TY9K7UQDKE5E"
}


variable "tools" {
  default = {
    vault = {
      instance_type = "t3.small"
      port = 8200
      iam_policy = {
        Action = []
        Resource = []
      }
    }
    # github-runner = {
    #   instance_type = "t3.small"
    #   port = 443 #dummy port
    #   iam_policy = {
    #     Action = ["*"]
    #     Resource = []
    #   }
    # }
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

}
