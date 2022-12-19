variable "region" {
  description = "The AWS region the workspace corresponds to."
  type = string
  default = "us-east-2"   # Ohio
}

variable "localstack" {
  description = ""
  default = {
      apigateway = "http://localhost:4566"
  }
}

# EC2 instance vars

variable "ec2_ami" {
  description = ""
  type = string
  default = "ami-0beaa649c482330f7"  # Amazon Linux free-tier eligible. See: https://us-east-2.console.aws.amazon.com/ec2/v2/home?region=us-east-2#LaunchInstances:
}

variable "instance_type" {
  description = "The type of EC2 instance to launch. NOTE: I was surprised to see that this is an optional arg when creating an aws_instance resource. I wonder what it defaults to?"
  type = string
  default = "t2.micro"  # Amazon Linux free-tier eligible.
}

variable "availability_zone" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#availability_zone"
  type = string
  default = null    # I think that by setting a default of null for an optional Arg I'm making not required, changing nothing except introducing the possibility for it to be set in .tfvars
}

variable "subnet_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#subnet_id"
  type = string
  default = null    
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with."
  type = string
  default = [""]  
}

variable "host_resource_group_arn" {
  description = "ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the tenancy parameter or set it to host."
  type = string
  default = null
}
