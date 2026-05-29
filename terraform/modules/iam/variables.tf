variable "policy_name" {
  description = "Managed policy ARN attached to the EC2 role."
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "Name of the IAM instance profile attached to the EC2 instance."
  type        = string
}

variable "ec2_role_name" {
  description = "Name of the IAM role assumed by the EC2 instance."
  type        = string
}
