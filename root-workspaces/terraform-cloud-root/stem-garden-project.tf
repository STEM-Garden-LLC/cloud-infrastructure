module "stem_garden_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "stem-garden"
  domain_name    = "stemgarden.org"
  workspace_list = ["dev", "stage", "prod", "shared"]


}