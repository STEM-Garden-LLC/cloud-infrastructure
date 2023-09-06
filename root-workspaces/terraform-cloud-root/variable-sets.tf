##############
##  GitHub  ##
##############

resource "tfe_variable_set" "gh_credentials" {
  name          = "Test Varset"
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

# The following vars were manually created in the Variable set: GitHub Organization App Registration
# I added these stubs while planning to import them but realized it was not a priority. 
# I got stuck trying to find the VARIABLE_ID required by the import command.
# 
# resource "tfe_variable" "gh_app_id" {
#   description     = "From the URL of the OAuth App in the Org"
#   key             = "github_app_id"
# #   value           = var.github_token
#   sensitive       = true
#   category        = "terraform"
# #   variable_set_id = tfe_variable_set.gh_credentials.id
# }

# resource "tfe_variable" "gh_app_installation_id" {
#   description     = "The Client ID from the OAuth App's settings"
#   key             = "github_app_id"
# #   value           = var.github_token
#   sensitive       = true
#   category        = "terraform"
# #   variable_set_id = tfe_variable_set.gh_credentials.id
# }

# resource "tfe_variable" "gh_app_pem_file" {
#   description     = "The Client Secret stored in Apple Passwords manager under github-oauth-app-for-tfc.com"
#   key             = "github_app_id"
# #   value           = var.github_token
#   sensitive       = true
#   category        = "terraform"
# #   variable_set_id = tfe_variable_set.gh_credentials.id
# }



###########
##  AWS  ##
###########