# module "s3_static_site" {
#   source = "../../modules/s3-static-site"

#   domain_name = "masterymath.org"
#   common_tags = {
#     project = "stemgarden.org"
#     provisioned_by = "terraform_cloud"
#   }

# }

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}


resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = var.common_tags
}
