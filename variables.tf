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
      root_block_device = 20
      iam_policy = {
        Action = []
        Resource = []
      }
    }
    github-runner = {
      instance_type = "t3.small"
      root_block_device = 30
      port = 443 #dummy port
      iam_policy = {
        Action = ["*"]
        Resource = []
      }
    }
  }
}