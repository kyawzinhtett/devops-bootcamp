module "vpc" {
  source = "./modules/vpc"

  project_name                       = var.project_name
  environment                        = var.environment
  vpc_cidr_block                     = var.vpc_cidr_block
  public_subnet_1_cidr_block         = var.public_subnet_1_cidr_block
  public_subnet_2_cidr_block         = var.public_subnet_2_cidr_block
  private_subnet_1_cidr_block        = var.private_subnet_1_cidr_block
  private_subnet_2_cidr_block        = var.private_subnet_2_cidr_block
  public_subnet_1_availability_zone  = var.public_subnet_1_availability_zone
  public_subnet_2_availability_zone  = var.public_subnet_2_availability_zone
  private_subnet_1_availability_zone = var.private_subnet_1_availability_zone
  private_subnet_2_availability_zone = var.private_subnet_2_availability_zone
}

module "ec2" {
  source                    = "./modules/ec2"
  vpc_id                    = module.vpc.vpc_id
  public_subnet_1_id        = module.vpc.public_subnet_1_id
  project_name              = var.project_name
  environment               = var.environment
  instance_type             = var.instance_type
  iam_instance_profile_name = module.iam.instance_profile_name

  depends_on = [module.iam]
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

module "iam" {
  source                    = "./modules/iam"
  policy_name               = var.policy_name
  ec2_role_name             = var.ec2_role_name
  ec2_instance_profile_name = var.instance_profile_name
}

module "db" {
  source                         = "./modules/rds"
  vpc_id                         = module.vpc.vpc_id
  app_security_group_id          = module.ec2.security_group_id
  private_subnet_1_id            = module.vpc.private_subnet_1_id
  private_subnet_2_id            = module.vpc.private_subnet_2_id
  project_name                   = var.project_name
  environment                    = var.environment
  db_name                        = var.db_name
  db_engine                      = var.db_engine
  db_engine_version              = var.db_engine_version
  db_instance_class              = var.db_instance_class
  db_user                        = var.db_user
  db_manage_master_user_password = var.db_manage_master_user_password
}
