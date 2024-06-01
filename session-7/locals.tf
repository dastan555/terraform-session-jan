locals {
  name = "aws-${var.team}-${var.env}-${var.project}-rtype-${var.app}"
  common_tags = {
    environment = var.env
    team        = var.team
    project     = var.project
    application = var.app
    Owner       = "Das"
    Managed_by  = "Terraform"
  }
  asg_tags = merge(
    { Name = replace(local.name, "rtype", "asg")},
    local.common_tags
  )
}

