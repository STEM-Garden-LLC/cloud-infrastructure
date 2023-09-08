module "acm_certificate_test" {
  source = "../../../modules/dns-certificate"

  apex_domain = "chessclubhost.com"
  subject_alternative_names = [ "*.chessclubhost.com" ]
}