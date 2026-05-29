variable "vpc_id" {
  description = "VPC ID where the EC2 security group is created."
  type        = string
}

variable "public_subnet_1_id" {
  description = "Public subnet ID where the EC2 application instance is launched."
  type        = string
}

variable "project_name" {
  description = "Project name used for AMI lookup, resource names, and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the application server."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name that grants AWS permissions to the EC2 instance."
  type        = string
}
