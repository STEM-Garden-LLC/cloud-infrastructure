

# The Hosted Zone currently exists in the management account and a transfer is required since I updated the provider assume role.

# resource "aws_route53_zone" "mastery_math" {
#   comment           = "Managed by TFC"
#   delegation_set_id = null
#   force_destroy     = null
#   name              = "masterymath.org"
# }




# module "acm_certificate_for_masterymath" {
#   source = "../../../modules/dns-certificate"

#   apex_domain = "masterymath.org"
#   subject_alternative_names = [ "*.masterymath.org" ]
# }