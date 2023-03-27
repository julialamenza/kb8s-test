module "dev_cluster" {
  source             = "./modules"
  cluster_name       = "eu-north-1-dev"
  instance_type      = "t3.medium"
  eks_public_access  = true
  eks_private_access = true
  db_id              = "docplanner"
  db_name            = "docplanner"
  db_user            = "docplanner"
  rds_instance_type  = "db.t3.small"
  allocated_storage  = 5
  maintenance_window = "Sat:00:00-Sat:03:00"
  backup_window      = "00:00-06:00"
}


# module "production_cluster" {
#   source        = "./modules"
#   cluster_name  = "production"
#   instance_type = "m5.large"
# }


