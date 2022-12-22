# ORGANIZATION

resource "aws_organizations_organization" "sgllc_org" {
  feature_set = "ALL"

  #   aws_service_access_principals = [
  #     "cloudtrail.amazonaws.com",
  #     "config.amazonaws.com",
  #   ]
}

# ORGANIZATIONAL UNITS -- LAYER 1

resource "aws_organizations_organizational_unit" "mastery_math" {
  name      = "Mastery Math"
  parent_id = aws_organizations_organization.sgllc_org.id
}






