# autor : Luis Merino Troncoso
# fecha : 02/03/2021
# descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# Creacion del backend en s3
/*terraform {
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "terraform-aws-network"
    bucket  = "koffeeluv"
  }
}*/

/* # ejecucion del module vpc pra desplegar la red
module "vpc" {
  source = "./vpc"

  cidr_block         = var.vpc_cidr
  workspace_id       = var.workspace_id
  region             = var.aws_region
  vpc                = var.aws_vpc
  public_subnets     = var.aws_public_subnets
  private_subnets    = var.aws_private_subnets
  availability_zones = var.aws_azs
} */