# Accounts beloning to the MASTERY MATH Organizational Unit

### Dev

resource "aws_organizations_account" "mm_dev" {
  name  = "Mastery Math Dev"
  email = "mm-dev@stemgarden.org"
  # parent_id = aws_organizations_organizational_unit.mastery_math.id
  parent_id = aws_organizations_organization.sgllc_org.roots[0].id
}

resource "aws_organizations_account" "mastery_math_dev" {
  name      = "Mastery Math Dev"
  email     = "masterymath+dev@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.mastery_math.id
}

### Staging

resource "aws_organizations_account" "mm_staging" {
  name      = "Mastery Math Prod"
  email     = "masterymath@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.mastery_math.id
}

resource "aws_organizations_account" "mm_staging_real" {
  name      = "Mastery Math Staging"
  email     = "mm-staging@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.mastery_math.id
}

resource "aws_organizations_account" "mastery_math_stage" {
  name      = "Mastery Math Stage"
  email     = "mastery_math+stage@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.mastery_math.id
}

### Prod 

resource "aws_organizations_account" "mm_prod" {
  name      = "Mastery Math Prod"
  email     = "masterymath@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.mastery_math.id
}

resource "aws_organizations_account" "mastery_math_prod" {
  name      = "Mastery Math Prod"
  email     = "mastery_math+prod@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.mastery_math.id
}
