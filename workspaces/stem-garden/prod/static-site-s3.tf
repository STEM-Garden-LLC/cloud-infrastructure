module "static_site_s3" {
  source = "../../../modules/s3-static-site"

  domain_name = "stemgarden.org"

  use_preexeisitng_bucket = false

  
}