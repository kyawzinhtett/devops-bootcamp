variable "project_name" {
  description = "Project name used in ALB resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used in ALB resource names and tags."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB and target group are created."
  type        = string
}

variable "public_subnet_1_id" {
  description = "First public subnet ID used by the public ALB."
  type        = string
}

variable "public_subnet_2_id" {
  description = "Second public subnet ID used by the public ALB."
  type        = string
}

variable "target_instance_id" {
  description = "EC2 instance ID registered as the ALB target."
  type        = string
}

variable "target_port" {
  description = "Port on the EC2 instance that receives traffic from the target group."
  type        = number
  default     = 80
}

variable "domain_name" {
  description = "Host name that the HTTPS listener rule forwards to the application target group."
  type        = string
}

variable "certificate_arn" {
  description = "ACM certificate ARN used by the HTTPS listener."
  type        = string
}

variable "health_check_path" {
  description = "HTTP path used by the ALB target group health check."
  type        = string
  default     = "/"
}

variable "alb_name" {
  description = "Name of the public Application Load Balancer."
  type        = string
}
