import {
  to = aws_iam_user.nigel_wilson
  id = "nigel-f-wilson"
}

# Imported
resource "aws_iam_user" "nigel_wilson" {
  name                 = "nigel-f-wilson"
  permissions_boundary = null
  force_destroy        = null
}

module "users" {
  source = "../../modules/iam-user-profile"
  for_each = toset(var.users)
  username = each.value
}

output "user_login_profiles" {
  value = {
    for profile in module.users : profile.username => profile.initial_password
  }
}

# resource "aws_iam_user" "test" {
#   name          = "test-user"
#   force_destroy = true
# }

# resource "aws_iam_user_login_profile" "test" {
#   user    = aws_iam_user.test.name
#   password_reset_required = true
# }

# output "password" {
#   value = aws_iam_user_login_profile.test.password
# }