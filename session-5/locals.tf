// Naming convention: Naming standard  

# 1. Provider name: aws, azure, google
# 2. Region: use1, usw1, usw2
# 3. Environment: dev, qa, stage, prod
# 4. Project name: batman, tom, jerry
# 5. Application tier: frontend, bakcend, db
# 6. Resource type: ec2, s3, alb, sg, rds

# syntax: provider_name-region-Environment-project_name-appication_tier-resource_type

# RDS Instance:
# aws-usw1-dev-jerry-db-rds

# S3 Bucket:
# aws-usw1-dev-jerry-frontend-s3

# EC2:
# aws-usw2-qa-tom-backend-ec2

//Taging Standard: Common Tags

# 1. Environment: dev, qa, stage, prod\
# 2. Project name: batman, tom, jerry\
# 3. Application tier: frontend, bakcend, db
# 4. Team: cloud, devops, development
# 5. Owner: Das
# 6. Managed_by = cloudformation, terraform, python, manual


locals {
  name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-rtype"

  common_tags = {
    environment = var.env
    project     = var.project
    tier        = var.tier
    team        = var.team
    owner       = var.owner
    managed_by  = var.managed_by
    tier        = var.tier
  }

}