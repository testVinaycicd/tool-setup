locals {
  policy_action = concat(["account:listRegions"], var.iam_policy["Action"])
}