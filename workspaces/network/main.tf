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

resource "aws_internet_gateway" "igw" {
 vpc_id = aws_vpc.vpc.id
 
 tags = merge(
    local.tags,
    {
      Name = format("sgllc-igw-%s", var.region)
    }
  )
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }
 
 tags = merge(
    local.tags,
    {
      Name = "2nd Route Table"
    }
  )
}

resource "aws_route_table_association" "public_subnet_association" {
#  for_each = { for each in aws_subnet.public_subnets : each.availability_zone => each }
 for_each = aws_subnet.public_subnets
 subnet_id      = each.value.id
 route_table_id = aws_route_table.second_rt.id
}

