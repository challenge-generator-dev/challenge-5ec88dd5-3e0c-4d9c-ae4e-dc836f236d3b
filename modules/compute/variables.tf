# Variables específicas para el módulo de computo
# Estas variables permiten personalizar la configuración del computo
# para diferentes entornos.

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para las instancias"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = "notifications-service-key"
}

variable "user_data" {
  description = "Script de user data para configurar las instancias al iniciarse"
  type        = string
  default     = ""
}

variable "enable_monitoring" {
  description = "Indica si se debe habilitar el monitoreo detallado para las instancias"
  type        = bool
  default     = true
}