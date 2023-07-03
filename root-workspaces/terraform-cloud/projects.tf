
resource "tfe_project" "mastery_math" {
  organization = tfe_organization.sgllc.name
  name = "Mastery Math"
}
