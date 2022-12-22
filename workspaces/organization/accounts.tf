# ACCOUNTS

## MANAGEMENT ACCOUNT

resource "aws_organizations_account" "stem_garden_llc" {
  name  = "STEM Garden LLC"
  email = "nigel@stemgarden.org"
  #   role_name = "Admin"
  # management_account
}


## MASTERY MATH 

### Dev

resource "aws_organizations_account" "mm_dev" {
  name  = "Mastery Math Dev"
  email = "mm-dev@stemgarden.org"
}

resource "aws_organizations_account" "mastery_math_dev" {
  name  = "Mastery Math Dev"
  email = "masterymath+dev@stemgarden.org"
}

### Staging

# resource "aws_organizations_account" "mm_staging" {
#   name  = "Mastery Math Staging"
#   email = "mm-staging@stemgarden.org"
# }

resource "aws_organizations_account" "mastery_math_stage" {
  name  = "Mastery Math Stage"
  email = "mastery_math+stage@stemgarden.org"
}

### Prod 

resource "aws_organizations_account" "mm_prod" {
  name  = "Mastery Math Prod"
  email = "masterymath@stemgarden.org"
}

resource "aws_organizations_account" "mastery_math_prod" {
  name  = "Mastery Math Prod"
  email = "mastery_math+prod@stemgarden.org"
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
