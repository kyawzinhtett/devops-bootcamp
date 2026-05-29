variable "vpc_id" {
  description = "VPC ID where the database security group is created."
  type        = string
}

variable "app_security_group_id" {
  description = "Security group ID of the application server allowed to connect to MySQL."
  type        = string
}

variable "private_subnet_1_id" {
  description = "First private subnet ID used by the RDS subnet group."
  type        = string
}

variable "private_subnet_2_id" {
  description = "Second private subnet ID used by the RDS subnet group."
  type        = string
}

variable "project_name" {
  description = "Project name used in RDS resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used in RDS resource names and tags."
  type        = string
}

variable "db_name" {
  description = "Initial database name created inside the RDS instance."
  type        = string
}

variable "db_engine" {
  description = "RDS database engine, for example mysql."
  type        = string
}

variable "db_engine_version" {
  description = "RDS database engine version."
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class for the database server."
  type        = string
}

variable "db_user" {
  description = "RDS master username."
  type        = string
}

variable "db_manage_master_user_password" {
  description = "When true, AWS stores and rotates the RDS master password in Secrets Manager."
  type        = bool
}
