variable "vpc_cidr_block" {
  description = "CIDR block for the main VPC."
  type        = string
}

variable "public_subnet_1_cidr_block" {
  description = "CIDR block for the first public subnet. This subnet hosts internet-facing resources such as the ALB and EC2 instance."
  type        = string
}

variable "public_subnet_2_cidr_block" {
  description = "CIDR block for the second public subnet. The ALB uses this for multi-AZ availability."
  type        = string
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block for the first private subnet used by the RDS subnet group."
  type        = string
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block for the second private subnet used by the RDS subnet group."
  type        = string
}

variable "public_subnet_1_availability_zone" {
  description = "Availability Zone for the first public subnet."
  type        = string
}

variable "public_subnet_2_availability_zone" {
  description = "Availability Zone for the second public subnet."
  type        = string
}

variable "private_subnet_1_availability_zone" {
  description = "Availability Zone for the first private subnet."
  type        = string
}

variable "private_subnet_2_availability_zone" {
  description = "Availability Zone for the second private subnet."
  type        = string
}

# Shared naming values used across resource names and tags.

variable "project_name" {
  description = "Short project name used in AWS resource names, tags, and AMI lookup filters."
  type        = string
}

variable "environment" {
  description = "Deployment environment name, such as dev, staging, or prod."
  type        = string
}

# EC2 application server settings.

variable "instance_type" {
  description = "EC2 instance type for the application server."
  type        = string
}

variable "domain_name" {
  description = "Fully qualified domain name routed by the HTTPS ALB listener."
  type        = string
}

variable "certificate_arn" {
  description = "ACM certificate ARN for the ALB HTTPS listener. The certificate must be in the same AWS region as the ALB."
  type        = string
}

variable "alb_name" {
  description = "Name of the public Application Load Balancer."
  type        = string
}

# IAM settings for the EC2 instance profile.

variable "policy_name" {
  description = "Managed policy ARN attached to the EC2 IAM role. Use AmazonSSMManagedInstanceCore for SSM Session Manager access."
  type        = string
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile attached to the EC2 instance."
  type        = string
}

variable "ec2_role_name" {
  description = "Name of the IAM role assumed by the EC2 instance."
  type        = string
}

# RDS database settings.

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
  description = "When true, AWS stores and rotates the RDS master password in Secrets Manager instead of requiring a plaintext password variable."
  type        = bool
}
