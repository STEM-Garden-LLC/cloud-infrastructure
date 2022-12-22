# ACCOUNTS

## MANAGEMENT ACCOUNT

resource "aws_organizations_account" "stem_garden_llc" {
  name  = "STEM Garden LLC"
  email = "nigel@stemgarden.org"
  #   role_name = "Admin"
  # management_account
}

#





# ACCOUNTS


# SEE https://tbekas.dev/posts/setting-up-an-aws-organization-from-scratch-with-terraform

# resource "aws_organizations_account" "users" {
#   name      = "acme-corp-users"
#   email     = "admin+users@acmecorp.com"
#   role_name = "Admin"
# }

# resource "aws_organizations_account" "staging" {
#   name      = "acme-corp-staging"
#   email     = "admin+staging@acmecorp.com"
#   role_name = "Admin"
# }

# resource "aws_organizations_account" "production" {
#   name      = "acme-corp-production"
#   email     = "admin+production@acmecorp.com"
#   role_name = "Admin"
# }
