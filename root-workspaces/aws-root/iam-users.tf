import {
  to = aws_iam_user.nigel_wilson
  id = "nigel-f-wilson"
}

resource "aws_iam_user" "nigel_wilson" {
  name                 = "nigel-f-wilson"
  permissions_boundary = null
  force_destroy        = null
}

resource "aws_iam_user" "test" {
  name          = "test-user"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "test" {
  user    = aws_iam_user.test.name
}

output "password" {
  value = aws_iam_user_login_profile.test.password
}