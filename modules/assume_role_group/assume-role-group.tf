variable "group_name" {
  type = string
  description = "An underscore separated string that indicates which Project(s) and Access Role types Group members can assume."
}

variable "group_members" {
  type = list(string)
  description = "The names of the IAM Users to add to the Group."
}

variable "assumeable_role_arns" {
  
}

