# ORG-WIDE SANDBOX ACCOUNT

resource "aws_organizations_account" "sgllc_sandbox" {
  name      = "SGLLC Sandbox"
  email     = "aws+sandbox@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.org_sandbox

  role_name = "Admin"
}
