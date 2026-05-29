output "rds_endpoint" {
  description = "Connection endpoint for the RDS database instance."
  value       = aws_db_instance.app_db.endpoint
}
