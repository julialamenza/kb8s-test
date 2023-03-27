
variable "cluster_name" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "m5.large"
}
variable "region" {
  default = "eu-north-1"
}
variable "eks_public_access" {
  description = "AWS EKS API public endpoint configuration"
  type        = bool
}

variable "eks_private_access" {
  description = "AWS EKS API private endpoint configuration"
  type        = bool
}



# Databases variables

variable "rds_instance_type" {
  description = "RDS Instance type"
  type        = string
}

variable "maintenance_window" {
  description = "RDS maintenance window"
  type        = string
}

variable "backup_window" {
  description = "RDS backup window"
  type        = string
}

variable "db_id" {
  description = "RDS Database ID"
  type        = string
}

variable "db_name" {
  description = "RDS Database name"
  type        = string
}

variable "db_user" {
  description = "RDS Database username"
  type        = string
}

variable "db_port" {
  description = "RDS Database connection port"
  type        = string
  default     = "3306"
}

variable "allocated_storage" {
  description = "RDS Database allocated storage in GB"
  type        = number
}
