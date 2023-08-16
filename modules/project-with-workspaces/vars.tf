variable "project_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "workspace_list" {
  type        = list(string)
  description = "List of workspaces belonging to this project. Names will be prefixed with project name."
}

variable "working_directory_prefix" {
  type = string
  description = "Default is workspaces but sometimes must be overidden with root-workspaces"
  default = "workspaces"
}