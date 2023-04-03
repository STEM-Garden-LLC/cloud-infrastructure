# variable "trusted_entity" {
#   type = string
# }

# resource "aws_iam_role" "this" {
#   name = "Developer"

#   assume_role_policy = data.template_file.trust_relationship.rendered
# }

# data "template_file" "trust_relationship" {
#   template = <<TEMPLATE
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "${trusted_entity}"
#       },
#       "Action": "sts:AssumeRole",
#       "Condition": {
#         "Bool": {
#           "aws:MultiFactorAuthPresent": "true"
#         }
#       }
#     }
#   ]
# }
# TEMPLATE

#   vars = {
#     trusted_entity = var.trusted_entity
#   }
# }

# resource "aws_iam_role_policy_attachment" "administrator_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#   role       = aws_iam_role.this.name
# }

# output "role_arn" {
#   value = aws_iam_role.this.arn
# }
