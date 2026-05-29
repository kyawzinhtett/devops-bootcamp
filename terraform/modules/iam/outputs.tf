output "instance_profile_name" {
  description = "Name of the IAM instance profile attached to EC2."
  value       = aws_iam_instance_profile.ec2_ssm.name
}
