############################
##    Admin Access Role   ##
############################



resource "aws_iam_role" "club_host_admin" {
  for_each = toset(var.managed_access_policy_names)

  name = "${each.value}"
  description = "Role that Users in the Org's management account can assume to manage resources in the Club Host member account."
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EnableCrossAccountAssumeRole"
        Effect = "Allow"
        Action = "sts:AssumeRole"
        "Principal": { "AWS": "arn:aws:iam::889823018333:root" }
      },
    ]
  })
  inline_policy {}
  managed_policy_arns = "arn:aws:iam::aws:policy/${each.value}"
}

##########################
##    DBA Access Role   ##
##########################

resource "aws_iam_role" "club_host_dba" {
  name = "club_host_dba_role"
  description = "Role that Users in the Org's management account can assume to manage resources in the Club Host member account."
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EnableCrossAccountAssumeRole"
        Effect = "Allow"
        Action = "sts:AssumeRole"
        "Principal": { "AWS": "arn:aws:iam::889823018333:root" }
      },
    ]
  })
  inline_policy {}
  managed_policy_arns = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
}


#########################
##    Read Only Role   ##
#########################

resource "aws_iam_role" "club_host_readonly" {
  name = "club_host_dba_role"
  description = "Role that Users in the Org's management account can assume to manage resources in the Club Host member account."
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EnableCrossAccountAssumeRole"
        Effect = "Allow"
        Action = "sts:AssumeRole"
        "Principal": { "AWS": "arn:aws:iam::889823018333:root" }
      },
    ]
  })
  inline_policy {}
  managed_policy_arns = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
}