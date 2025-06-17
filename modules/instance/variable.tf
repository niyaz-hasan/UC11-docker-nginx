variable "subnet_id" {
  type = string
}

variable "name" {
  type = string
}

variable "user_data" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "vpc_depend_on" {
}

variable "instance_keypair" {
}