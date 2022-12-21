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

resource "aws_subnet" "public_subnets" {
  for_each = { for each in var.public_subnet_inputs : each.availability_zone => each }
  vpc_id   = aws_vpc.vpc.id

  availability_zone = format("%s%s", var.region, each.value.availability_zone)
  cidr_block        = each.value.cidr_block

  tags = merge(
    local.tags,
    {
      Name = "Public Subnet ${each.value.availability_zone}"
    }
  )
}

resource "aws_subnet" "private_subnets" {
  for_each = { for each in var.private_subnet_inputs : each.availability_zone => each }
  vpc_id   = aws_vpc.vpc.id

  availability_zone = format("%s%s", var.region, each.value.availability_zone)
  cidr_block        = each.value.cidr_block

  tags = merge(
    local.tags,
    {
      Name = "Private Subnet ${each.value.availability_zone}"
    }
  )
}
