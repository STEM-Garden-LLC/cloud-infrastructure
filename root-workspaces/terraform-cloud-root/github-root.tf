resource "tfe_workspace" "github_root" {
  name        = "github-root"
  description = "Config of GitHub resources such as actions, environment variables, and secrets."

  working_directory = "root-workspaces/github-root"

  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}
