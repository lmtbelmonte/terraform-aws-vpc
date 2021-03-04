# Autor : Luis Merino Troncoso
# Fecha : 02/03/2021
# Descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# Primero para el bastion
# Trafico entrada Ingress

resource "aws_security_group" "sg-bastion" {
  provider    = aws.region-01
  name        = join("-", [var.workspace_id, "sg-Bastion"])
  description = "Permitir el trafico hacia el Bastion Host"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = join("-", [var.workspace_id, "sg-Bastion"])
  }
}

resource "aws_security_group_rule" "ssh" {
  provider          = aws.region-01
  type              = "ingress"
  security_group_id = aws_security_group.sg-bastion.id
  protocol          = "tcp"
  cidr_blocks       = [var.external_ip]
  from_port         = 22
  to_port           = 22
}

resource "aws_security_group_rule" "sg-app-from-bastion" {
  provider                 = aws.region-01
  type                     = "ingress"
  description              = "Permite el accesso SSH desde el Bastion Security Group"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-appServer.id
  source_security_group_id = aws_security_group.sg-bastion.id
}
# Trafico salida - Egress 

resource "aws_security_group" "sg-appServer" {
  provider    = aws.region-01
  name        = join("-", [var.workspace_id, "sg-appServer"])
  description = "Permitir el trafico del App Server hacia el Nat"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = join("-", [var.workspace_id, "sg-appServer"])
  }
}

resource "aws_security_group_rule" "sg-nat" {
  provider          = aws.region-01
  type              = "egress"
  security_group_id = aws_security_group.sg-appServer.id
  protocol          = "tcp"
  cidr_blocks       = [var.external_ip]
  from_port         = 80
  to_port           = 80
}

# para que el haya trafico de salida desde el bastion hacia el appserver
# hay que crear un egress rule

resource "aws_security_group_rule" "sg-ssh-bastion" {
  provider                 = aws.region-01
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-bastion.id
  source_security_group_id = aws_security_group.sg-appServer.id
}