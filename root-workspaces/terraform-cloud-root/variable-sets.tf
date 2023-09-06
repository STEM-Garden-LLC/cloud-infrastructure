##############
##  GitHub  ##
##############

resource "tfe_variable_set" "gh_credentials" {
  name          = "GitHub Credentials"
  description   = "Some description."
  organization  = tfe_organization.sgllc.name
}

variable "github_token" {
  type = string
}

resource "tfe_variable" "gh_personal_access_token" {
  description     = "nigel-f-wilson's personal access token"
  key             = "GITHUB_TOKEN"
  value           = var.github_token
  sensitive       = true
  category        = "env"
  variable_set_id = tfe_variable_set.gh_credentials.id
}

resource "tfe_variable_set" "gh_org_app_registration" {
  name          = "GitHub TFC App Installation"
  description   = "The Terraform Cloud App that is installed in the STEM Garden LLC GitHub Org."
  organization  = tfe_organization.sgllc.name
}


###########
##  AWS  ##
###########