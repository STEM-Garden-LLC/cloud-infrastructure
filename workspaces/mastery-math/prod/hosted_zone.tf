locals {
    domain_name = "masterymath.org"
    project_name = "mastery-math"
    common_tags = {
        project = "masterymath.org"
        provisioned_by = "terraform_cloud"
    }
}

resource "aws_route53_zone" "mastery_math" {
  name = local.domain_name
  tags = local.common_tags
}