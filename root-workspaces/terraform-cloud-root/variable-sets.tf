##############
##  GitHub  ##
##############

resource "tfe_variable_set" "gh_credentials" {
  name          = "Test Varset"
  description   = "Some description."
  organization  = tfe_organization.test.name
}

variable "github_token" {
  type = string
}

resource "tfe_variable" "gh_personal_access_token" {
  description     = "nigel-f-wilson's personal access token"
  key             = "GITHUB_TOKEN"
  value           = var.github_token
  category        = "env"
  variable_set_id = tfe_variable_set.gh_credentials.id
}



###########
##  AWS  ##
###########