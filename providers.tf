# Configuración del proveedor AWS y versión de Terraform requerida
# Este archivo define el proveedor AWS y establece la versión mínima de Terraform
# para asegurar compatibilidad con las características utilizadas.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = var.aws_region
  
  # Tags por defecto para todos los recursos creados
  default_tags {
    tags = {
      Environment     = var.environment
      Project         = "notifications-service"
      Terraform       = "true"
      ManagedBy       = "Terraform"
    }
  }
}

# Variables requeridas por el proveedor AWS
variable "aws_region" {
  description = "La región de AWS donde se aprovisionará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "El entorno para el que se aprovisiona la infraestructura (dev, prod, etc.)"
  type        = string
  default     = "dev"
}