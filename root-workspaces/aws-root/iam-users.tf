import {
  to = aws_iam_user.nigel_wilson
  id = "nigel-f-wilson"
}

resource "aws_iam_user" "nigel_wilson" {
  name                 = "nigel-f-wilson"
  permissions_boundary = null
  force_destroy        = null
}

# resource "aws_iam_user" "example" {
