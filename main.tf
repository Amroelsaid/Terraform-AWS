module "VPC" {
  source   = "./modules/VPC"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "vpc-project"

}

module "Subnet" {
  source = "./modules/Subnet"
  vpc_id = module.VPC.vpc_id
  subnet_map = var.subnet_map
}

module "Networking" {
  source            = "./modules/Networking"
  vpc_id            = module.VPC.vpc_id
  public_subnet_id  = element(module.Subnet.public_subnets, 0)
}

module "Instances" {
  source             = "./modules/Instances"
  ami_id             = "ami-0e54eba7c51c234f6"  # Ubuntu 20.04 AMI
  instance_type      = "t2.micro"
  private_subnet_ids = module.Subnet.private_subnets
  public_subnet_id   = element(module.Subnet.public_subnets, 0)
  key_name           = "my-key"
  ec2_sg_id          = module.Networking.ec2_sg_id
  bastion_sg_id      = module.Networking.bastion_sg_id
}

module "LoadBalancer" {
  source            = "./modules/LoadBalancer"
  vpc_id            = module.VPC.vpc_id
  alb_sg_id         = module.Networking.alb_sg_id
  public_subnet_ids = module.Subnet.public_subnets
  ec2_instance_ids  = module.Instances.nginx_instance_ids
}

