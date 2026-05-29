output "vpc_id" {
  description = "ID of the VPC created for the bootcamp stack."
  value       = module.vpc.vpc_id
}

output "instance_id" {
  description = "ID of the EC2 application instance."
  value       = module.ec2.instance_id
}

output "security_group_id" {
  description = "ID of the EC2 application security group."
  value       = module.ec2.security_group_id
}

output "rds_endpoint" {
  description = "Connection endpoint for the private RDS database."
  value       = module.db.rds_endpoint
}

output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer."
  value       = module.alb.dns_name
}
