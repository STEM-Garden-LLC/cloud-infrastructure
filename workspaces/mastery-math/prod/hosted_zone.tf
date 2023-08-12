locals {
    domain_name = "masterymath.org"
    project_name = "mastery-math"
    common_tags = {
        project = "masterymath.org"
        provisioned_by = "terraform_cloud"
    }
}

import {
  to = aws_route53_zone.mastery_math
  id = "Z06677023RZS93Q99ME56"
}

resource "aws_route53_zone" "mastery_math" {
  name = local.domain_name
  tags = local.common_tags
}