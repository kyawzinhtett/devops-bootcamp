output "instance_id" {
  description = "ID of the EC2 application instance."
  value       = aws_instance.this.id
}

output "security_group_id" {
  description = "ID of the EC2 application security group."
  value       = aws_security_group.instance_sg.id
}
