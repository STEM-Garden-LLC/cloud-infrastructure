module "mastery_math_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "mastery-math"
  workspace_list = toset(["dev", "stage", "prod", "shared"])
}