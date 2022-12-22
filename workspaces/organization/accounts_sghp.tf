# Accounts for managing the various environments of the STEM Garden Homepage

### Dev
resource "aws_organizations_account" "sghp_dev" {
  name      = "STEM Garden Homepage Dev"
  email     = "aws+dev@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
}

# DO NOT IMPORT. SUSPENDED. CLOSE PENDING 90 DAY WIAT
# resource "aws_organizations_account" "mastery_math_dev" {
#   name      = "STEM Garden Homepage Dev"
#   email     = "developers@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
# }

### Stage

resource "aws_organizations_account" "sghp_stage" {
  name      = "STEM Garden Homepage Stage"
  email     = "aws+stage@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
}

# DO NOT IMPORT. PLAN TO SUSPEND & CLOSE PENDING 90 DAY WIAT & QUOTA RESET
# resource "aws_organizations_account" "sg-staging" {
#   name      = "STEM Garden Homepage Staging"
#   email     = "mm-staging@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
# }

### Prod 

resource "aws_organizations_account" "sghp_prod" {
  name      = "STEM Garden Homepage Prod"
  email     = "aws+prod@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
}

# DO NOT IMPORT. SUSPENDED. CLOSE PENDING 90 DAY WIAT
# resource "aws_organizations_account" "sg_prod" {
#   name      = "STEM Garden Website Prod"
#   email     = "sg-prod@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.stem_garden_homepage.id
# }

