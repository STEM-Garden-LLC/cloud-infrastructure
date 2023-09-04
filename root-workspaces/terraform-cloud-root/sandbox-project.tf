module "sandbox_project_and_workspaces" {
  source = "../../modules/tfc-project-with-workspaces"

  project_name   = "sandbox"
  domain_name    = "example.com"
  workspace_list = [
    "github-action-push-to-s3",
    "static-site-s3-cf-r53",
    "next-on-amplify",
    "node-on-ec2"
  ]
}
