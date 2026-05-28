module "vpc" {
  source                = "./modules/vpc"
  cidr_block            = var.cidr_block
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}

module "ec2" {
  source             = "./modules/ec2"
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  project_name       = var.project_name
  environment        = var.environment
  instance_type      = var.instance_type
}

module "alb" {
  source = "./modules/loadbalancer"

  alb_name           = var.alb_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  target_instance_id = module.ec2.instance_id
  project_name       = var.project_name
  environment        = var.environment
  domain_name        = var.domain_name
  certificate_arn    = var.certificate_arn
}
