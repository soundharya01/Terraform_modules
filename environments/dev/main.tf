module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
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
