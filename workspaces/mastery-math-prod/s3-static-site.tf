module "s3_static_site" {
  source = "../../modules/s3-static-site"

  domain_name = "masterymath.org"
}

