# Variables específicas para el módulo de red
# Estas variables permiten personalizar la configuración de la red
# para diferentes entornos.

variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad donde se desplegarán las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Indica si se debe crear un NAT Gateway para las subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Indica si se debe usar un solo NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}