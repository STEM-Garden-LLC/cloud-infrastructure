
variable "username" {
  type = string
}

resource "aws_iam_user" "user" {
  name          = var.user
  force_destroy = true
}

resource "aws_iam_user_login_profile" "login_profile" {
  user    = aws_iam_user.user.name
  password_reset_required = true
}

output "username" {
  value = aws_iam_user_login_profile.login_profile.user
}

output "initial_password" {
  value = aws_iam_user_login_profile.login_profile.password
}


