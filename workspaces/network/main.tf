# resource "aws_iam_role" "role" {
#   name               = "access-key-generator-role"
#   assume_role_policy = data.aws_iam_policy_document.assume.json
# }

resource "aws_vpc" "vpc" {
  #   name = format("sgllc-vpc-%s", var.region)
  # Region is not an argument to VPC, it is inherited from the AWS Provider

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default" # Only other option is "dedicated"

  enable_dns_support   = true # default is true
  enable_dns_hostnames = true # default is __?

  tags = merge(
    local.tags,
    {
      Name = format("sgllc-vpc-%s", var.region)
    }
  )
}

  tags = local.tags
}
