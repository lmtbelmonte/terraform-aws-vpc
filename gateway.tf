# autor : Luis Merino Troncoso
# fecha : 02/03/2021
# descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# Internet gateways  
resource "aws_internet_gateway" "igw" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "igw"])
  }
}

# creamos la default route table
resource "aws_route_table" "default" {
  provider = aws.region-01
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = join("-", [var.workspace_id, "rt-default"])
  }
}

# Asociacion con  la route table default.  
resource "aws_main_route_table_association" "default-rt-assoc" {
  provider       = aws.region-01
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.default.id
}
