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