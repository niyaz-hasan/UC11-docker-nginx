output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_eip" {
  value = module.instance.public_ip
}

output "instance_id" {
  value = module.instance.instance_id
}

