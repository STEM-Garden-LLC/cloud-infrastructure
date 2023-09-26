##############
##  GitHub  ##
##############

# Personal Access Token

resource "tfe_variable_set" "gh_credentials" {
  name          = "GitHub Credentials"
  description   = "Personal Access Token for nigel-f-wilson account on GitHub"
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

resource "tfe_variable" "gh_personal_access_token_tf_var" {
  description     = "nigel-f-wilson's personal access token"
  key             = "TF_VAR_github_token"
  value           = var.github_token
  sensitive       = true
  category        = "env"
  variable_set_id = tfe_variable_set.gh_credentials.id
}


# App Registration

resource "tfe_variable_set" "gh_org_app_registration" {
  name          = "GitHub TFC App Installation"
  description   = "The Terraform Cloud App that is installed in the STEM Garden LLC GitHub Organization"
  organization  = tfe_organization.sgllc.name
}


###########
##  AWS  ##
###########

resource "tfe_variable_set" "aws_credentials_nfw" {
  name          = "AWS Credentials"
  description   = "Access Key ID and Secret Access Key for AWS account with Admin access to SGLLC. User: nigel-f-wilson"
  organization  = tfe_organization.sgllc.name
}

variable "aws_access_key_id" {
  type = string
}

resource "tfe_variable" "aws_access_key_id" {
  description     = "nigel-f-wilson's AWS Access Key ID ending with \"HAYGS\""
  key             = "AWS_ACCESS_KEY_ID"
  value           = var.aws_access_key_id
  sensitive       = true
  category        = "env"
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
}

resource "tfe_variable" "tf_var_aws_access_key_id" {
  description     = "nigel-f-wilson's AWS Access Key ID ending with \"HAYGS\""
  key             = "TF_VAR_aws_access_key_id"
  value           = var.aws_access_key_id
  sensitive       = true
  category        = "env"
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
}

variable "aws_secret_access_key" {
  type = string
}

resource "tfe_variable" "aws_secret_access_key" {
  description     = "nigel-f-wilson's AWS Secret Access Key. Goes with Key ID ending \"HAYGS\""
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = var.aws_secret_access_key
  sensitive       = true
  category        = "env"
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
}

resource "tfe_variable" "tf_var_aws_secret_access_key" {
  description     = "nigel-f-wilson's AWS Secret Access Key. Goes with Key ID ending \"HAYGS\""
  key             = "TF_VAR_aws_secret_access_key"
  value           = var.aws_secret_access_key
  sensitive       = true
  category        = "env"
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
}

