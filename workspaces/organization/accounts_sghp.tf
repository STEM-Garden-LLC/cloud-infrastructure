# Accounts for managing the various environments of the STEM Garden Homepage

### Dev

resource "aws_organizations_account" "sghp_dev" {
  name  = "STEM Garden Homepage Dev"
  email = "aws+sghp_dev@stemgarden.org"

  parent_id                  = aws_organizations_organizational_unit.stem_garden_homepage.id
  close_on_deletion          = true
  iam_user_access_to_billing = "ALLOW" # This is the default

  role_name = "Admin" # The default is OrganizationAccountAccessRole but it is assigned Admin priviledges and this will make assuming the role easier (less typing)
  # There is no AWS Organizations API for reading role_name, so the following ignore is required to silence would be inaccurate drift detection.
  lifecycle {
    ignore_changes = [role_name]
  }
}

# DO NOT IMPORT. SUSPENDED. CLOSE PENDING 90 DAY WIAT
# resource "aws_organizations_account" "mastery_math_dev" {
#   name      = "STEM Garden Homepage Dev"
#   email     = "developers@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
# }

### Stage

# # Uncomment and Apply once there is room in the Quota
# resource "aws_organizations_account" "sghp_stage" {
#   name      = "STEM Garden Homepage Stage"
#   email     = "aws+stage@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
#   role_name = "Admin"
# }

# DO NOT IMPORT. PLAN TO SUSPEND & CLOSE PENDING 90 DAY WIAT & QUOTA RESET
# resource "aws_organizations_account" "sg-staging" {
#   name      = "STEM Garden Homepage Staging"
#   email     = "mm-staging@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
# }

### Prod 

# Uncomment and Apply once there is room in the Quota
# resource "aws_organizations_account" "sghp_prod" {
#   name      = "STEM Garden Homepage Prod"
#   email     = "aws+prod@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
#   role_name = "Admin"
# }

resource "aws_organizations_account" "sghp_prod" {
  name  = "STEM Garden Homepage Prod"
  email = "aws+sghp_prod@stemgarden.org"

  parent_id                  = aws_organizations_organizational_unit.stem_garden_homepage.id
  close_on_deletion          = true
  iam_user_access_to_billing = "ALLOW" # This is the default

  role_name = "Admin" # The default is OrganizationAccountAccessRole but it is assigned Admin priviledges and this will make assuming the role easier (less typing)
  # There is no AWS Organizations API for reading role_name, so the following ignore is required to silence would be inaccurate drift detection.
  lifecycle {
    ignore_changes = [role_name]
  }
}

# DO NOT IMPORT. SUSPENDED. CLOSE PENDING 90 DAY WIAT
# resource "aws_organizations_account" "sg_prod" {
#   name      = "STEM Garden Website Prod"
#   email     = "sg-prod@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
# }

