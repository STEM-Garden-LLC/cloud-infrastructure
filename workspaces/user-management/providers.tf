
# Default Provider - Un-Aliased

provider "aws" {
  region = var.region

}


# Aliased Providers -- Not really sure which Workspacce these belong in yet.

provider "aws" {
  alias  = "users"
  region = var.region

  # assume_role {
  #   role_arn = "arn:aws:iam::${aws_organizations_account.users.id}:role/Admin"
  # }
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.stem_garden_llc.id}:role/Admin"
  }
}

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.staging.id}:role/Admin"
#   }

#   alias  = "staging"
#   region = var.region
# }

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/Admin"
#   }

#   alias  = "production"
#   region = var.region
# }
