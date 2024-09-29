module "static_site_s3" {
  source = "../../../modules/s3-static-site"

  tfc_project = var.tfc_project
  tfc_workspace = var.tfc_workspace

  bucket_name = local.bucket_name

  apex_domain = var.apex_domain
  sub_domain = var.sub_domain

}