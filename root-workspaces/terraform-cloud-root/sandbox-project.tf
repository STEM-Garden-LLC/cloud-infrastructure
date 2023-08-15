module "sandbox_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "sandbox"
  workspace_list = [
    "s3_bucket_github_actions",
    "static_site_s3_cf_r53",
    "next_on_amplify",
    "node_on_ec2"
  ]
}
