##########################
##       Sandbox        ##
##########################

module "sandbox_project_and_workspaces" {
  source = "../../modules/tfc-project-with-workspaces"

  project_name   = "sandbox"
  domain_name    = "example.com"
  workspace_list = [
    "github-action-push-to-s3",
    # "static-site-s3-cf-r53",
    # "next-on-amplify",
    # "node-on-ec2",
    "react-with-vite-test",
    "create-github-secrets",
    "amazon-certificate-manager-test"
  ]
}

##########################
##     Mastery Math     ##
##########################

module "mastery_math_project_and_workspaces" {
  source = "../../modules/tfc-project-with-workspaces"

  project_name   = "mastery-math"
  domain_name    = "masterymath.org"
  workspace_list = ["dev", "stage", "prod", "shared"]
}


##########################
##      STEM Garden     ##
##########################

module "stem_garden_project_and_workspaces" {
  source = "../../modules/tfc-project-with-workspaces"

  project_name   = "stem-garden"
  domain_name    = "stemgarden.org"
  workspace_list = ["dev", "stage", "prod", "shared"]


}

##########################
##   Chess Club Host    ##
##########################

module "chess_club_host_project_and_workspaces" {
  source = "../../modules/tfc-project-with-workspaces"

  project_name   = "chess-club-host"
  domain_name    = "chessclubhost.com"
  workspace_list = ["dev", "stage", "prod", "shared"]


}
