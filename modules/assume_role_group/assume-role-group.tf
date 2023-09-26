variable "group_name" {
  type = string
  description = "An underscore separated string that indicates which Project(s) and Access Role types Group members can assume."
}

variable "group_members" {
  type = list(string)
  description = "The names of the IAM Users to add to the Group."
}

variable "assumable_role_arns" {
  type = list(string)
  description = "Used to attach one or more Project Account Role to a single Group in the Management Account."
}

