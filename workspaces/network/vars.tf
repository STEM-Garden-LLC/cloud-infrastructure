variable "workspace" {
  description = "The Terraform Cloud Workspace. Corresponds to the name of this directory."
  type        = string
}

variable "region" {
  description = "The AWS region the workspace corresponds to."
  type        = string
  default     = "us-east-2" # Ohio
}

# SUBNET INPUTS

# variable "public_subnet_inputs" {
#   description = "Inputs for the Public Subnet as objects."
#   type = list(object({
#     availability_zone = string
#     cidr_block        = string
#   }))
# }

# variable "private_subnet_inputs" {
#   description = "Inputs for the Private Subnet as objects."
#   type = list(object({
#     availability_zone = string
#     cidr_block        = string
#   }))
# }
