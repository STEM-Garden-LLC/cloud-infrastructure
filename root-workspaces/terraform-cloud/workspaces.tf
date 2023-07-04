

resource "tfe_workspace" "mastery_math_prod" {
  name         = "mastery-math-prod"
  organization = tfe_organization.sgllc.name
  project_id = tfe_project.mastery_math.id
  description = "Production infrastructure for masterymath.org"
  allow_destroy_plan = false
  execution_mode = "remote"
  working_directory = "/workspaces/mastery-math-prod"
  trigger_patterns = ["/workspaces/mastery-math-prod/*"]
  vcs_repo {
    identifier = "stem-garden-llc/cloud-infrastructure"
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
  }

}
