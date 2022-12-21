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

variable "public_subnet_inputs" {
  description = "Inputs for the Public Subnet as objects."
  type = list(object({
    availability_zone = string
    cidr_block        = string
  }))

  default = [
    {
      availability_zone = "a"
      cidr_block        = "10.0.1.0/24"
    },
    {
      availability_zone = "b"
      cidr_block        = "10.0.2.0/24"
    },
    {
      availability_zone = "c"
      cidr_block        = "10.0.3.0/24"
    }
  ]
}

variable "private_subnet_inputs" {
  description = "Inputs for the Private Subnet as objects."
  type = list(object({
    availability_zone = string
    cidr_block        = string
  }))

  default = [
    {
      availability_zone = "a"
      cidr_block        = "10.0.4.0/24"
    },
    {
      availability_zone = "b"
      cidr_block        = "10.0.5.0/24"
    },
    {
      availability_zone = "c"
      cidr_block        = "10.0.6.0/24"
    }
  ]
}
