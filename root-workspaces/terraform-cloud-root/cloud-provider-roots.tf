resource "tfe_project" "cloud_provider_roots" {
  name = "Cloud Provider Roots"
}


############################
##  Terraform Cloud Root  ##
############################

resource "tfe_workspace" "terraform_cloud_root" {
  name              = "terraform-cloud-root"
  project_id        = tfe_project.cloud_provider_roots.id
  description       = "Structure of TFC Organization."
  working_directory = "root-workspaces/terraform-cloud-root"

  trigger_patterns = [ "root-workspaces/terraform-cloud-root/**/*" ]
  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}

#####################
##     AWS Root    ##
#####################

resource "tfe_workspace" "aws_root" {
  name              = "aws-root"
  project_id        = tfe_project.cloud_provider_roots.id
  description       = "Shared Core AWS resources. Not related to any one project."
  working_directory = "root-workspaces/aws-root"

  trigger_patterns = [ "root-workspaces/aws-root/**/*" ]
  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}

#####################
##   Azure Root    ##
#####################

resource "tfe_workspace" "azure_root" {
  name              = "azure-root"
  project_id        = tfe_project.cloud_provider_roots.id
  description       = "Shared Core Azure resources. Not related to any one project."
  working_directory = "root-workspaces/azure-root"

  trigger_patterns = [ "root-workspaces/azure-root/**/*" ]
  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}

#####################
##   GitHub Root   ##
#####################

resource "tfe_workspace" "github_root" {
  name        = "github-root"
  description = "Config of GitHub resources such as actions, environment variables, and secrets."

  project_id        = tfe_project.cloud_provider_roots.id
  working_directory = "root-workspaces/github-root"

  trigger_patterns = [ "root-workspaces/github-root/**/*" ]
  file_triggers_enabled = true
  queue_all_runs        = true
  force_delete          = false

  vcs_repo {
    github_app_installation_id = "ghain-vi62wYKcwTykbwke"
    identifier                 = "STEM-Garden-LLC/cloud-infrastructure"
    ingress_submodules         = false
  }
}




