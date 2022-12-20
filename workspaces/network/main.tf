# resource "aws_iam_role" "role" {
#   name               = "access-key-generator-role"
#   assume_role_policy = data.aws_iam_policy_document.assume.json
# }

resource "aws_vpc" "vpc_ohio" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default" # Only other option is "dedicated"

  enable_dns_support = true     # default is true

  tags = local.tags
}
