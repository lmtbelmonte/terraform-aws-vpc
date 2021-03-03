# definimos los varios providers por si queremos en el futuro multiregion
provider "aws" {
  profile = var.profile
  region  = var.aws_region
  alias   = "region-01"
}