


# Test Resource
resource "github_repository" "tfc_test_repo" {
  name        = "TFC-test-repo"
  description = "My awesome codebase"

  visibility = "public"
  has_issues = true
#   has_discussions = true
#   has_projects = true
  allow_squash_merge = true
  allow_rebase_merge = true


}