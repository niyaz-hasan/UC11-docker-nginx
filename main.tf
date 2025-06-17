module "vpc" {
  source = "./modules/vpc"
  name           = var.name
  vpc_cidr_block = var.vpc_cidr_block
  
}



module "sg_group" {
  source     = "./modules/sg_group"
  vpc_id     = module.vpc.vpc_id
}



locals {
  user_data = <<-EOF
         #!/bin/bash
         sudo apt update -y
         sudo apt-get install -y docker.io
         sudo systemctl start docker
         sudo systemctl enable docker
         usermod -aG docker ubuntu
         docker run -d -p 80:80 nginx:latest
    EOF
}




module "instance" {
  source          = "./modules/instance"
  subnet_id       = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg_group.ec2_security_group_id]
  user_data       = local.user_data
  name            = var.name
  vpc_depend_on   = module.vpc.vpc_depend_on
  instance_keypair = var.instance_keypair
}

module "null_resource" {
  source = "./modules/null_resource"
  ec2_depends_on = module.instance.ec2_depends_on
  public_ip   =  module.instance.public_ip
}
