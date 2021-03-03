# Autor : Luis Merino Troncoso
# Fecha : 02/03/2021
# Descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch

# Utilizamos data y aws SSM Parameter Store para recojerl ami_id 
# en value deja el resultado

# Primero creamos la instancia para Bastion

data "aws_ssm_parameter" "linuxAmi" {
  provider = aws.region-01
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# hay que crear el par de claves para hacer el login en las instancias us-east-1 
resource "aws_key_pair" "ssh-key" {
  provider   = aws.region-01
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Creamos la instancia bastion en la publica A

resource "aws_instance" "bastion-A" {
  provider                    = aws.region-01
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = var.aws_bastion_instance_type
  key_name                    = aws_key_pair.ssh-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg-bastion.id]
  subnet_id                   = aws_subnet.subnet_publica.id

  tags = {
    Name = join("-", [var.workspace_id, "Bastion-A"])
  }
  depends_on = [aws_main_route_table_association.default-rt-assoc]
}
