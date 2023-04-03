# ACCOUNTS

## ROOT MANAGEMENT ACCOUNT

resource "aws_organizations_account" "stem_garden_llc" {
  name  = "STEM Garden LLC"
  email = "nigel@stemgarden.org"
  # role_name = "Admin"  # Should be set to "Admin" for all new accounts but adding it retroactively necessiutates a destroy & recreate which we want to avoid due to quotas.
}

## USER & IAM MANAGEMENT ACCOUNT

resource "aws_organizations_account" "user_management_account" {
  name  = "User Management Account SGLLC"
  email = "aws+users@stemgarden.org"

  parent_id                  = aws_organizations_organization.sgllc_org.roots[0].id # This is the default but must be stated to enable drift detection. It's not the Org's id, it's the Root Account's id.
  close_on_deletion          = true                                                
  iam_user_access_to_billing = "ALLOW"                                              # This is the default

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
