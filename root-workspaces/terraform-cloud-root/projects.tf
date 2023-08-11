resource "tfe_project" "cloud_provider_roots" {
  name = "Cloud Provider Roots"
}

resource "tfe_workspace" "terraform_cloud_root" {
  name = "terraform-cloud-root"
}

resource "tfe_workspace" "aws_root" {
  name = "aws-root"
}

resource "tfe_workspace" "azure_root" {
  name = "azure-root"
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

