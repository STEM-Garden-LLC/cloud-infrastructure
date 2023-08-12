locals {
  project_name_formatted = title(replace(var.project_name, "-", " "))
}

resource "tfe_project" "module_project" {
  name = local.project_name_formatted
}

resource "tfe_workspace" "workspaces_from_list" {
  for_each = toset(var.workspace_list)

  name              = "${var.project_name}-${each.value}"
  project_id        = tfe_project.module_project.id
  description       = "Infrastructure hosting the ${each.key} environment of masterymath.org"
  working_directory = "${var.working_directory_prefix}/${var.project_name}/${each.key}"

  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}
