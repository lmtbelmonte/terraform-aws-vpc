# autor : Luis Merino Troncoso
# fecha : 02/03/2021
# descripcion : Automating Infrastructure for an E-commerce Website with Terraform and AWS
#               Network layout from scratch
# variables-main.tf: variables globales para el despliegue

variable "workspace_id" {
  type        = string
  description = "Identificador del despliegue para los tags"
  default     = "kofeeLuv"
}

variable "profile" {
  type        = string
  description = "Profile aws"
  default     = "default"
}

variable "aws_bastion_instance_count" {
  type        = number
  description = "Numero de bastion-hosts para acceder via ssh, 1 por AZ  "
  default     = 3
}

variable "aws_bastion_instance_type" {
  type        = string
  description = "tipo de instancia para los bastion, en principio t3.micro."
  default     = "t3.micro"
}

variable "aws_appserver_instance_count" {
  type        = number
  description = "Numero de app servers, en pricipio 1 por az "
  default     = 3
}

variable "aws_appserver_instance_type" {
  type        = string
  description = "Tipo de instancia para el appserver , este valor ira en funcion de la carga."
  default     = "t3.micro"
}

variable "aws_ami" {
  default     = "ami-0915bcb5fa77e4892"
  type        = string
  description = "la ami va en funcion de la region, en este caso esta para us-east-1"
}

variable "aws_bastion_root_volume_type" {
  type        = string
  description = "Tipo de volumen para el root block device."
  default     = "gp2"
}

variable "aws_bastion_root_volume_size" {
  type        = string
  description = "Tamaño del volumen en GB del root volume."
  default     = 20
}

variable "aws_bastion_root_volume_iops" {
  type        = string
  description = "ignorado si el tipo no es io1"
  default     = 0
}

variable "aws_appserver_root_volume_type" {
  type        = string
  description = "Tipo de volumen para el root block device."
  default     = "gp2"
}

variable "aws_appserver_root_volume_size" {
  type        = string
  description = "Tamaño del volumen en GB del root volume."
  default     = 20
}

variable "aws_appserver_root_volume_iops" {
  type        = string
  description = "ignorado si el tipo no es io1"
  default     = 0
}

variable "aws_region" {
  type        = string
  description = "Region donde se van a desplegar los recursos."
  default     = "us-east-1"
}

variable "aws_azs" {
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  type        = list(string)
  description = "AZ donde desplegar los appserver."
}

variable "aws_vpc" {
  type        = string
  default     = "172.16.0.0/16"
  description = "VPC ID del delpliegue."
}

variable "external_ip" {
  type        = string
  default     = "0.0.0.0/0"
  description = "ip para acceso externo para gateway."
}

variable "aws_public_subnets" {
  type        = list(string)
  default     = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
  description = "List de Subnets publicas donde se va a desplegAR los bastion y NAT."
}

variable "aws_private_subnets_App" {
  type        = list(string)
  default     = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
  description = "lista de sunbnets privadas donde se va a desplegar la App."
}

variable "aws_private_subnets_Db" {
  type        = list(string)
  default     = ["172.16.8.0/24", "172.16.9.0/24", "172.16.10.0/24"]
  description = "lista de sunbnets privadas donde se va a desplegar la Bd."
}