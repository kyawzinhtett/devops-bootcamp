variable "cidr_block" {
  description = "AWS VPC CIDR"
  type        = string
  default     = ""
}

variable "public_subnet_1_cidr" {
  description = "VPC Public Subnet CIDR"
  type        = string
  default     = ""
}

variable "public_subnet_2_cidr" {
  description = "VPC Public Subnet CIDR"
  type        = string
  default     = ""
}

variable "private_subnet_1_cidr" {
  description = "VPC Private Subnet CIDR"
  type        = string
  default     = ""
}

variable "private_subnet_2_cidr" {
  description = "VPC Private Subnet CIDR"
  type        = string
  default     = ""
}

################################################
## Ec2 Variable
################################################

variable "project_name" {
  description = "Project name for AMI lookup and tags"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}
#######################################


variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "alb_name" {
  type    = string
  default = ""
}
