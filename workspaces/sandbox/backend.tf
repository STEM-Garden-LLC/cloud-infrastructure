terraform {
    # required_version = "~> 1.3.1" # pessimistic
    required_version = ">= 1.3.1" # optomistic

    cloud {
        hostname = "app.terraform.io"
        organization = "stem-garden-llc"

        workspaces {
            name = "sandbox"
            # tags = ["source:cli"]
        }
    }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 4.47.0"
        }
    }
}
