module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "s3_backend" {
  source = "../../modules/s3-backend"

  bucket_name          = var.s3_bucket_name
  dynamodb_table_name  = var.dynamodb_table_name
  environment          = "dev"
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = var.ecr_repository_name
  environment     = "dev"
}

module "ecs_security_group" {
  source = "../../modules/ecs-security-group"

  vpc_id      = module.vpc.vpc_id
  name        = "${var.ecs_cluster_name}-sg"
  environment = "dev"
}

module "ecs" {
  source = "../../modules/ecs"

  cluster_name       = var.ecs_cluster_name
  service_name       = var.ecs_service_name
  task_family        = var.ecs_task_family
  container_name     = var.container_name
  container_image    = var.container_image
  container_port     = var.container_port
  cpu                = var.ecs_cpu
  memory             = var.ecs_memory
  desired_count      = var.ecs_desired_count
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.ecs_security_group.security_group_id]
  environment        = "dev"

  depends_on = [module.vpc]
}

module "ec2" {
  source = "../../modules/ec2"

  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.vpc.public_subnet_ids[0]
  instance_name = var.instance_name
  key_name      = var.key_name

  depends_on = [module.vpc]
}

