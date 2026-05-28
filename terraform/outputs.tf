output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.ec2.security_group_id
}

output "ami_id" {
  value = module.ec2.ami_id
}
