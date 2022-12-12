terraform {
    cloud {
        hostname = "app.terraform.io"
        organization = "stem-garden-llc"

        workspaces {
            name = "sandbox"
            # tags = ["source:cli"]
        }
    }
}
