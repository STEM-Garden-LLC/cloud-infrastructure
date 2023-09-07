######################################
##   GitHub Personal Access Token   ##
######################################

resource "tfe_workspace_variable_set" "gh_pat_to_root" {
  variable_set_id = tfe_variable_set.gh_credentials.id
  workspace_id    = tfe_workspace.github_root.id
}

resource "tfe_project_variable_set" "gh_pat_to_sandbox" {
  variable_set_id = tfe_variable_set.gh_credentials.id
  project_id    = module.sandbox_project_and_workspaces.project_id
}

########################
##   AWS Access Key   ##
########################

resource "tfe_workspace_variable_set" "aws_key_to_root" {
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
  workspace_id    = tfe_workspace.aws_root.id
}

resource "tfe_project_variable_set" "aws_key_to_sandbox" {
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
  project_id    = module.sandbox_project_and_workspaces.project_id
}

resource "tfe_project_variable_set" "aws_key_to_stemgarden" {
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
  project_id    = module.stem_garden_project_and_workspaces.project_id
}

resource "tfe_project_variable_set" "aws_key_to_masterymath" {
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
  project_id    = module.mastery_math_project_and_workspaces.project_id
}

resource "tfe_project_variable_set" "aws_key_to_chessclubhost" {
  variable_set_id = tfe_variable_set.aws_credentials_nfw.id
  project_id    = module.chess_club_host_project_and_workspaces.project_id
}