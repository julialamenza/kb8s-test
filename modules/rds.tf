module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "db-sg"
  description = "Complete MySQL example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]


}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "4.2.0"

  identifier = "demodb"

  engine               = "mysql"
  engine_version       = "5.7"
  major_engine_version = "5.7"
  family               = "mysql5.7"
  instance_class       = var.rds_instance_type
  allocated_storage    = var.allocated_storage

  db_name  = var.db_name
  username = var.db_user
  port     = 3306

  iam_database_authentication_enabled = true

  # DB subnet group
  subnet_ids             = module.vpc.private_subnets
  create_db_subnet_group = true
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  monitoring_interval    = "30"
  monitoring_role_name   = "RDSMonitoringRole"
  create_monitoring_role = true



  # Database Deletion Protection
  deletion_protection = false

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

}
