
import {
  to = aws_route53_zone.mastery_math
  id = "Z06677023RZS93Q99ME56"
}

resource "aws_route53_zone" "mastery_math" {
  comment           = "Managed by TFC"
  delegation_set_id = null
  force_destroy     = null
  name              = "masterymath.org"
  
}