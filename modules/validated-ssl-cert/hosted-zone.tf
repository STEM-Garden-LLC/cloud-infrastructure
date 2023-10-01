# Use Data source if Zone ID provided in module call...

data "aws_route53_zone" "main" {
  count = local.use_existing_hosted_zone ? 0 : 1
  name = local.complete_domain
}

# Otherwise create a new Hosted Zone

resource "aws_route53_zone" "main" {
  count = local.use_existing_hosted_zone ? 0 : 1
  name = local.complete_domain
}