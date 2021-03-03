# autor : Luis Merino Troncoso
# fecha : 02/03/2021
# descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# Creacion de la VPC en us-east-1
resource "aws_vpc" "vpc" {
  provider             = aws.region-01
  cidr_block           = var.aws_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = join("-", [var.workspace_id, "vpc"])
  }
}

# Subnets de la vpc para ello utilizamos un bloque data para
# recoger una lista de las AZ de esa region

data "aws_availability_zones" "azs" {
  provider = aws.region-01
  state    = "available"
}

# creamos las subnets utilizando los datos de la lista para las az
# en la primera AZ creamos 3 subnet

resource "aws_subnet" "subnet_publica" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_public_subnets[0]
  tags = {
    Name = join("-", [var.workspace_id, "publicA"])
  }
}

resource "aws_subnet" "subnet_private_appa" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_private_subnets_App[0]
  tags = {
    Name = join("-", [var.workspace_id, "AppA"])
  }
}

resource "aws_subnet" "subnet_private_dba" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_private_subnets_Db[0]
  tags = {
    Name = join("-", [var.workspace_id, "DbA"])
  }
}

# creamos las subnets utilizando los datos de la lista para las az
# en la 2 AZ creamos 3 subnet

resource "aws_subnet" "subnet_publicb" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 1)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_public_subnets[1]
  tags = {
    Name = join("-", [var.workspace_id, "publicB"])
  }
}

resource "aws_subnet" "subnet_private_appb" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 1)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_private_subnets_App[1]
  tags = {
    Name = join("-", [var.workspace_id, "AppB"])
  }
}

resource "aws_subnet" "subnet_private_dbb" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 1)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_private_subnets_Db[1]
  tags = {
    Name = join("-", [var.workspace_id, "DbB"])
  }
}

# creamos las subnets utilizando los datos de la lista para las az
# en la 3 AZ creamos 3 subnet

resource "aws_subnet" "subnet_publicc" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 2)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_public_subnets[2]
  tags = {
    Name = join("-", [var.workspace_id, "publicC"])
  }
}

resource "aws_subnet" "subnet_private_appc" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 2)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_private_subnets_App[2]
  tags = {
    Name = join("-", [var.workspace_id, "AppC"])
  }
}

resource "aws_subnet" "subnet_private_dbc" {
  provider          = aws.region-01
  availability_zone = element(data.aws_availability_zones.azs.names, 2)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.aws_private_subnets_Db[2]
  tags = {
    Name = join("-", [var.workspace_id, "DbC"])
  }
}