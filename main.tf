variable "net_prfix" {}
variable "vpc_region" {}
variable "cidr" {}
variable "name" {}
variable "tags" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.name}"

  cidr = "${var.cidr}"

  azs              = [
    "${format("%sa", var.vpc_region)}",
    "${format("%sb", var.vpc_region)}",
    "${format("%sc", var.vpc_region)}"
  ]

  public_subnets   = [
    "${format("%s.1.0/24", var.net_prfix)}",
    "${format("%s.2.0/24", var.net_prfix)}",
    "${format("%s.3.0/24", var.net_prfix)}"
  ]
  private_subnets  = [
    "${format("%s.11.0/24", var.net_prfix)}",
    "${format("%s.12.0/24", var.net_prfix)}",
    "${format("%s.13.0/24", var.net_prfix)}"
  ]
  database_subnets = [
    "${format("%s.21.0/24", var.net_prfix)}",
    "${format("%s.22.0/24", var.net_prfix)}",
    "${format("%s.23.0/24", var.net_prfix)}"
  ]

  # Disable it so it won't allocatre an EIP
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = true
  enable_dns_support     = true

  tags = "${var.tags}"
}

output "vpc_id" {
  value = "${module.eiq-vpc.vpc_id}"
}

output "public_subnets" {
  value = "${module.eiq-vpc.public_subnets}"
}

output "public_subnets_cidr_blocks" {
  value = "${module.eiq-vpc.public_subnets_cidr_blocks}"
}

output "public_route_table_ids" {
  value = "${module.eiq-vpc.public_route_table_ids}"
}

output "database_subnets_cidr_blocks" {
  value = "${module.eiq-vpc.database_subnets_cidr_blocks}"
}

output "private_subnets_cidr_blocks" {
  value = "${module.eiq-vpc.private_subnets_cidr_blocks}"
}

output "private_subnets" {
  value = "${module.eiq-vpc.private_subnets}"
}

output "database_subnets" {
  value = "${module.eiq-vpc.database_subnets}"
}
