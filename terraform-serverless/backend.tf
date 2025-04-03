terraform {
  backend "remote" {
    organization = "moinuddin"

    workspaces {
      name = "terraform-serverless"
    }
  }
}
