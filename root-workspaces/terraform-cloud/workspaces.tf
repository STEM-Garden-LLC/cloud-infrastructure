

resource "tfe_workspace" "mastery_math_prod" {
  name         = "mastery-math-prod"
  organization = tfe_organization.sgllc.name
  tag_names    = ["test", "app"]
}
