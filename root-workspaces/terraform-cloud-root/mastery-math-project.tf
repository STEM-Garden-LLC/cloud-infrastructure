resource "tfe_project" "mastery_math_project" {
  name = "Mastery Math"
}

locals {
  workspace_list = [
    {
        name = "workspace made with for each 1",
        working_directory = "workspaces/mastery-math/test1"
    },{
        name = "workspace made with for each 2",
        working_directory = "workspaces/mastery-math/test2"
    }
  ]
}

resource "tfe_workspace" "workspace_list" {
  for_each = local.workspace_list

  name = each.value.name
  project_id = tfe_project.mastery_math_project.id
  description = "Production infrastructure hosting masterymath.org" 
  working_directory             = each.value.working_directory
  
  file_triggers_enabled  = true
  queue_all_runs                = true
  force_delete                  = false
  
  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke" 
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure" 
    ingress_submodules         = false 
  }
}

resource "tfe_workspace" "mastery_math_prod" {
  name = "mastery-math-prod"
  project_id = tfe_project.mastery_math_project.id
  description = "Production infrastructure hosting masterymath.org" 
  working_directory             = "workspaces/mastery-math/prod"
  
  file_triggers_enabled  = true
  queue_all_runs                = true
  force_delete                  = false
  
  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke" 
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure" 
    ingress_submodules         = false 
  }
}

resource "tfe_workspace" "mastery_math_stage" {
  name = "mastery-math-stage"
  project_id = tfe_project.mastery_math_project.id
  description = "Staging infrastructure hosting masterymath.org" 
  working_directory             = "workspaces/mastery-math/stage"
  
  file_triggers_enabled  = true
  queue_all_runs                = true
  force_delete                  = false
  
  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke" 
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure" 
    ingress_submodules         = false 
  }
}

resource "tfe_workspace" "mastery_math_dev" {
  name = "mastery-math-dev"
  project_id = tfe_project.mastery_math_project.id
  description = "Development infrastructure hosting masterymath.org" 
  working_directory             = "workspaces/mastery-math/dev"
  
  file_triggers_enabled  = true
  queue_all_runs                = true
  force_delete                  = false
  
  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke" 
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure" 
    ingress_submodules         = false 
  }
}


# resource "tfe_project" "mastery_math" {
#   name = "Mastery Math"
# }

# resource "tfe_project" "stem_garden_homepage" {
#   name = "STEM Garden Homepage"
# }

# resource "tfe_project" "chess_club_host" {
#   name = "Chess Club Host"
# }

