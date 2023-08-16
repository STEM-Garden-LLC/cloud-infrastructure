module "stem_garden_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "stem-garden"
  workspace_list = ["dev", "stage", "prod", "shared"]

  
}