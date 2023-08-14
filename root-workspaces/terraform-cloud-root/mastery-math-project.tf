module "mastery_math_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "mastery-math"
  workspace_list = ["dev", "stage", "prod", "shared"]
}

resource "tfe_workspace" "mastery_math_old" {
  name = "mastery-math-old"
}
