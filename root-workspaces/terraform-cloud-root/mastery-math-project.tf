module "mastery_math_project_and_workspaces" {
  source = "../../modules/tfc-project-with-workspaces"

  project_name   = "mastery-math"
  domain_name    = "masterymath.org"
  workspace_list = ["dev", "stage", "prod", "shared"]
}
