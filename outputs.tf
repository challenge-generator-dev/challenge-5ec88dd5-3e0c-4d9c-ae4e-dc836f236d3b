# Salidas de valores clave para consumo externo y verificación
# Expone los IDs y endpoints críticos aprovisionados

output "vpc_id" {
  description = "ID de la VPC principal aprovisionada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block de la VPC principal"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network.private_subnet_ids
}

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = module.compute.instance_ids
}

output "instance_public_ips" {
  description = "IPs públicas de las instancias EC2"
  value       = module.compute.instance_public_ips
}

output "load_balancer_dns" {
  description = "DNS del Application Load Balancer"
  value       = module.compute.alb_dns_name
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.compute.alb_arn
}

output "security_group_id" {
  description = "ID del Security Group del servicio de notificaciones"
  value       = aws_security_group.notifications_service.id
}

output "environment" {
  description = "Entorno desplegado"
  value       = var.environment
}