# resource "tfe_workspace" "sandbox" {
#   name = "sandbox"
#   # project_id        = 
#   description       = "Infrastructure hosting the ${each.key} environment of masterymath.org"
#   working_directory = "${var.working_directory_prefix}/${var.project_name}/${each.key}"

#   file_triggers_enabled = true
#   queue_all_runs        = true
#   execution_mode        = "remote"


#   allow_destroy_plan = false
#   force_delete       = true


#   vcs_repo {
#     github_app_installation_id = "ghain-vi62wYKcwTykbwke"
#     identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
#     ingress_submodules         = false
#   }
# }

