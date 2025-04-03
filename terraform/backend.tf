terraform {
  cloud {
    organization = "moinuddin"  # Terraform Cloud organization name

    workspaces {
      name = "ecs-service-simpletimeapp"  # Terraform Cloud workspace name
    }
  }
}
