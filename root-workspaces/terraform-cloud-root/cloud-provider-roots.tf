resource "tfe_project" "cloud_provider_roots" {
  name = "Cloud Provider Roots"
}

resource "tfe_workspace" "terraform_cloud_root" {
  name              = "terraform-cloud-root"
  project_id        = tfe_project.cloud_provider_roots.id
  description       = "Structure of TFC Organization."
  working_directory = "root-workspaces/terraform-cloud-root"

  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}

resource "tfe_workspace" "aws_root" {
  name              = "aws-root"
  project_id        = tfe_project.cloud_provider_roots.id
  description       = "Shared Core AWS resources. Not related to any one project."
  working_directory = "root-workspaces/aws-root"

  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}

resource "tfe_workspace" "azure_root" {
  name              = "azure-root"
  project_id        = tfe_project.cloud_provider_roots.id
  description       = "Shared Core Azure resources. Not related to any one project."
  working_directory = "root-workspaces/azure-root"

  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}

