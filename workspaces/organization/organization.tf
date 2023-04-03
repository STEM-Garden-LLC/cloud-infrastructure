# ORGANIZATION

resource "aws_organizations_organization" "sgllc_org" {
  feature_set = "ALL"

  #   aws_service_access_principals = [
  #     "cloudtrail.amazonaws.com",
  #     "config.amazonaws.com",
  #   ]
}

# ORGANIZATIONAL UNITS -- LAYER 1

resource "aws_organizations_organizational_unit" "projects" {
  name      = "Projects"
  parent_id = aws_organizations_organization.sgllc_org.roots[0].id
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organization.sgllc_org.roots[0].id
}

# PROJECTS OU -- LAYER 2

resource "aws_organizations_organizational_unit" "mastery_math" {
  name      = "Mastery Math"
  parent_id = aws_organizations_organizational_unit.projects.id
}

resource "aws_organizations_organizational_unit" "stem_garden_homepage" {
  name      = "STEM Garden Homepage"
  parent_id = aws_organizations_organizational_unit.projects.id
}

# SANDBOX OU -- LAYER 2

resource "aws_organizations_organizational_unit" "key_cloak" {
  name      = "KeyCloak"
  parent_id = aws_organizations_organizational_unit.sandbox.id
}


