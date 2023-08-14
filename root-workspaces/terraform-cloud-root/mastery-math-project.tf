module "mastery_math_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "mastery-math"
  workspace_list = ["dev", "stage", "prod", "shared"]
}

resource "tfe_workspace" "mastery_math_old" {
  name = "mastery-math-old"
  description = "Production infrastructure hosting masterymath.org generated with stand alone resources prior to creation of the project-with-workspaces module."

  working_directory = "workspaces/mastery-math/old"

  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}
