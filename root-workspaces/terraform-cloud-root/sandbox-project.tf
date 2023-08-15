module "sandbox_project_and_workspaces" {
  source = "../../modules/project-with-workspaces"

  project_name   = "sandbox"
  workspace_list = [
    "s3-bucket-github-actions",
    "static-site-s3-cf-r53",
    "next-on-amplify",
    "node-on-ec2"
  ]
}
