output "instance_id" {
  value = aws_instance.this.id
}

output "security_group_id" {
  value = aws_security_group.instance_sg.id
}

output "ami_id" {
  description = "The Packer-built AMI selected for the EC2 instance"
  value       = data.aws_ami.this.id
}
