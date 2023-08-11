resource "tfe_project" "mastery_math_project" {
  name = "Mastery Math"
}

resource "tfe_workspace" "mastery_math_prod" {
  name = "terraform-cloud-root"
  description = "Production infrastructure hosting masterymath.org" 
  working_directory             = "root-workspaces/terraform-cloud-root"
  
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
  name = "terraform-cloud-root"
  description = "Staging infrastructure hosting masterymath.org" 
  working_directory             = "root-workspaces/terraform-cloud-root"
  
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
  name = "terraform-cloud-root"
  description = "Development infrastructure hosting masterymath.org" 
  working_directory             = "root-workspaces/terraform-cloud-root"
  
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

