# ACCOUNTS

## ROOT MANAGEMENT ACCOUNT

resource "aws_organizations_account" "stem_garden_llc" {
  name  = "STEM Garden LLC"
  email = "nigel@stemgarden.org"
  role_name = "Admin"
}

## USER & IAM MANAGEMENT ACCOUNT

resource "aws_organizations_account" "user_management_account" {
  name  = "User Management Account SGLLC"
  email = "aws+users@stemgarden.org"

  parent_id = aws_organizations_organization.sgllc_org.id # This is the default but must be stated to enable drift detection
  close_on_deletion = true # I'm curious if this argument causes immediate deletion or is still subject to the 90 day suspension period before deletion.
  iam_user_access_to_billing = "ALLOW" # This is the default
  role_name = "Admin" # The default is OrganizationAccountAccessRole but it is assigned Admin priviledges and this will make assuming the role easier (less typing)

  # There is no AWS Organizations API for reading role_name, so the following ignore is required to silence would be inaccurate drift detection.
  lifecycle {
    ignore_changes = [role_name]
  }
}

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
