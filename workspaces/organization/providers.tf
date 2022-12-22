# ROOT ACCOUNT PROVIDER

provider "aws" {
  region = var.region

}

# ALIASED PROVIDERS to other ACCOUNTS

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.users.id}:role/Admin"
#   }

#   alias  = "users"
#     region = var.region

# }

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.staging.id}:role/Admin"
#   }

#   alias  = "staging"
#     region = var.region

# }

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/Admin"
#   }

#   alias  = "production"
#     region = var.region

# }
