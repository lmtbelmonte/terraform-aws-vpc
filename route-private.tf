# autor : Luis Merino Troncoso
# fecha : 02/03/2021
# descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# creamos la routr table para la PrivateA 
resource "aws_route_table" "rt-private-a" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-private-AppA"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-privatea" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-private-a.id
  subnet_id      = aws_subnet.subnet_private_appa.id
}

# Creacion de la ruta al NAT gateway para el trafico de salida 
resource "aws_route" "route-nat-a" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-private-a.id
  nat_gateway_id         = aws_nat_gateway.nat-a.id
}

# creamos la routr table para la PrivateB 
resource "aws_route_table" "rt-private-b" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-private-AppB"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-privateb" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-private-b.id
  subnet_id      = aws_subnet.subnet_private_appb.id
}

# Creacion de la ruta al NAT gateway para el trafico de salida 
resource "aws_route" "route-nat-b" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-private-b.id
  nat_gateway_id         = aws_nat_gateway.nat-b.id
}

# creamos la routr table para la Private-App 
resource "aws_route_table" "rt-private-c" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-private-AppC"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-privatec" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-private-c.id
  subnet_id      = aws_subnet.subnet_private_appc.id
}

# Creacion de la ruta al NAT gateway para el trafico de salida 
resource "aws_route" "route-nat-c" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-private-c.id
  nat_gateway_id         = aws_nat_gateway.nat-c.id
}

# creamos la routr table para la Private-db 
resource "aws_route_table" "rt-private-dba" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-private-DbA"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-privat-dba" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-private-dba.id
  subnet_id      = aws_subnet.subnet_private_dba.id
}

# Creacion de la ruta al NAT gateway para el trafico de salida 
resource "aws_route" "route-nat-dba" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-private-dba.id
  nat_gateway_id         = aws_nat_gateway.nat-a.id
}

# creamos la routr table para la Private-db 
resource "aws_route_table" "rt-private-dbb" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-private-DbB"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-privat-dbb" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-private-dbb.id
  subnet_id      = aws_subnet.subnet_private_dbb.id
}

# Creacion de la ruta al NAT gateway para el trafico de salida 
resource "aws_route" "route-nat-dbb" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-private-dbb.id
  nat_gateway_id         = aws_nat_gateway.nat-b.id
}

# creamos la routr table para la Private-db 
resource "aws_route_table" "rt-private-dbc" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-private-DbC"])
  }
}

# Asociamos la route table a las subnet
resource "aws_route_table_association" "route-privat-dbc" {
  provider       = aws.region-01
  route_table_id = aws_route_table.rt-private-dbc.id
  subnet_id      = aws_subnet.subnet_private_dbc.id
}

# Creacion de la ruta al NAT gateway para el trafico de salida 
resource "aws_route" "route-nat-dbc" {
  provider               = aws.region-01
  destination_cidr_block = var.external_ip
  route_table_id         = aws_route_table.rt-private-dbc.id
  nat_gateway_id         = aws_nat_gateway.nat-c.id
}