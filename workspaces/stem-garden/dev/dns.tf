resource "aws_route53_zone" "main" {
  name = local.complete_domain
}

module "ssl_certificate" {
  source = "../../../modules/validated-ssl-cert"

  tfc_project = var.tfc_project
  tfc_workspace = var.tfc_workspace

  apex_domain = var.apex_domain
  sub_domain = var.sub_domain

}