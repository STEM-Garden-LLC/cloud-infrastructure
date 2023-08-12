# module "s3_static_site" {
#   source = "../../modules/s3-static-site"

#   domain_name = "masterymath.org"
#   common_tags = {
#     project = "stemgarden.org"
#     provisioned_by = "terraform_cloud"
#   }

# }

resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = var.common_tags
}
