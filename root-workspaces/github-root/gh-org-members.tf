data "github_user" "nigel-f-wilson" {
  username = "nigel-f-wilson"
}

# Commenting out to test solution to ERROR: 403 You must be a member of STEM-Garden-LLC to see membership information for nigel-f-wilson.

# resource "github_membership" "nigel_wilson" {
#   username = "nigel-f-wilson"
#   role     = "admin"
# }

# resource "github_membership" "bruce_lindman" {
#   username = "sqlblindman"
#   role     = "member"
# }