# autor : Luis Merino Troncoso
# fecha : 02/03/2021
# descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# creamos la routr table para la PublicA 
resource "aws_route_table" "rt-publica" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-publicA"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-publica" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-publica.id
  subnet_id      = aws_subnet.subnet_publica.id
}

# creacion de la ruta al gateway 
resource "aws_route" "igw_route" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-publica.id
  gateway_id             = aws_internet_gateway.igw.id
}

# creamos la routr table para la PublicB 
resource "aws_route_table" "rt-publicb" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-publicB"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-publicb" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-publicb.id
  subnet_id      = aws_subnet.subnet_publicb.id
}

# creacion de la ruta al gateway 
resource "aws_route" "igw_route_b" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-publicb.id
  gateway_id             = aws_internet_gateway.igw.id
}

# creamos la routr table para la Publicc
resource "aws_route_table" "rt-publicc" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-publicC"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-publicc" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-publicc.id
  subnet_id      = aws_subnet.subnet_publicc.id
}

# creacion de la ruta al gateway 
resource "aws_route" "igw_route_c" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-publicc.id
  gateway_id             = aws_internet_gateway.igw.id
}