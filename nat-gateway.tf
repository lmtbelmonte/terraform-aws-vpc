# Autor : Luis Merino Troncoso
# Creacion de los NAT gateway 1 por cada az

# creacion de la eip para el NAT-A
resource "aws_eip" "eip-nat-a" {
  provider = aws.region-01
  vpc      = true
  tags = {
    Name = join("-", [var.workspace_id, "eip-NAT-A"])
  }
}

# creacion del NAT-A
resource "aws_nat_gateway" "nat-a" {
  provider      = aws.region-01
  allocation_id = aws_eip.eip-nat-a.id
  subnet_id     = aws_subnet.subnet_publica.id

  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = join("-", [var.workspace_id, "GW-NAT-A"])
  }
}

# creacion de la eip para el NAT-B
resource "aws_eip" "eip-nat-b" {
  provider = aws.region-01
  vpc      = true
  tags = {
    Name = join("-", [var.workspace_id, "eip-NAT-B"])
  }
}

# creacion del NAT-B
resource "aws_nat_gateway" "nat-b" {
  provider      = aws.region-01
  allocation_id = aws_eip.eip-nat-b.id
  subnet_id     = aws_subnet.subnet_private_appa.id

  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = join("-", [var.workspace_id, "GW-NAT-B"])
  }
}

# creacion de la eip para el NAT-C
resource "aws_eip" "eip-nat-c" {
  provider = aws.region-01
  vpc      = true
  tags = {
    Name = join("-", [var.workspace_id, "eip-NAT-C"])
  }
}

# creacion del NAT-B
resource "aws_nat_gateway" "nat-c" {
  provider      = aws.region-01
  allocation_id = aws_eip.eip-nat-c.id
  subnet_id     = aws_subnet.subnet_private_dbc.id

  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = join("-", [var.workspace_id, "GW-NAT-C"])
  }
}
