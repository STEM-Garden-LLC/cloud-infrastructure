data "github_user" "nigel-f-wilson" {
  username = "nigel-f-wilson"
}

resource "github_membership" "nigel_wilson" {
  username = "nigel-f-wilson"
  role     = "admin"
}

