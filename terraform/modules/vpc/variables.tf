variable "project_name" {
  description = "Project name used in resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block assigned to the VPC."
  type        = string
}

variable "public_subnet_1_cidr_block" {
  description = "CIDR block assigned to the first public subnet."
  type        = string
}

variable "public_subnet_2_cidr_block" {
  description = "CIDR block assigned to the second public subnet."
  type        = string
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block assigned to the first private subnet."
  type        = string
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block assigned to the second private subnet."
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
