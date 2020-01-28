# terraform-aws-vpc
A consistent way to create VPCs

```
module "vpc-virginia" {
  source="./modules/vpc"
  cidr = "10.0.0.0/16"
  vpc_region = "us-east-1"
  net_prfix = "10.0"
  name = "vpc-virginia"
  tags = "${var.tags}"
}

module "vpc-frankfurt" {
  source="./modules/vpc"
  cidr = "10.10.0.0/16"
  vpc_region = "eu-central-1"
  net_prfix = "10.10"
  name = "vpc-frankfurt"
  tags = "${var.tags}"
}

module "vpc-ireland" {
  source="./modules/vpc"
  cidr = "10.20.0.0/16"
  vpc_region = "eu-west-1"
  net_prfix = "10.20"
  name = "vpc-ireland"
  tags = "${var.tags}"
}
```
