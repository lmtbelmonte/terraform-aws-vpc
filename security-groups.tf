# Autor : Luis Merino Troncoso
# Fecha : 02/03/2021
# Descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# Primero para el bastion

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